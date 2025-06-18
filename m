Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650C8C7115B
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jun 2025 07:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=57aKzeu1I0Z8r4VtQPVgn+nBrMr5R7k20mO4BbYd+G4=; b=Wm/W2fouZV7Y/D
	htLfyass1kPEWap5IiGseIsV0pa5aab4SZAnNIAxFeGo5k9BvsmKxIbIMLS9XG7RtE/ePmfJA0Jze
	Z3LioIP8OBmgVjqb74GLi7ldjiyhTL3HQpUHhbF9CKpT6h0WJY+DAhDiHxYS4nIknuqM9GeKpUSl/
	1seba1OW1LTrEWkSe/2MT5ewLqgJj0coahOwIYUUwbTZsxEHAGoWw/RZyunJJ/WH7c9TRKrhC/4XI
	VEy7JQYxzKpJm1B/D+aUCUHeENf5eC3TRqV86AMx3WiBVFxJ+Hkc19O88SPzNDBdhrRv1AiEa+J6r
	8rGBHcFv/tJ0vGetjArA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnZU-00000009KmI-0BVz;
	Wed, 18 Jun 2025 07:51:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnXF-00000009KSH-1cH6;
	Wed, 18 Jun 2025 07:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 885286112C;
	Wed, 18 Jun 2025 07:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA4CC4CEE7;
	Wed, 18 Jun 2025 07:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750232920;
	bh=+/zmf0Zit1fRNlUV5u/lb+nGJi/dBvp3kAUks71W9P0=;
	h=From:Subject:Date:To:Cc:From;
	b=PquaoUNyLF0WxQ6Sx6Up9q7eFUUOgbvrZCWwkUXyfJw1MqfsvLprQF1mFmeu8jvAB
	 atmT0aOFdO/6dUYvl443aWq0i/eTS5HC6oGQLvJd+KPF+RIn1InVRFONm2IKEcvxFM
	 i5oCSTwzd8IWqNzxnXyUP1Ay643J+RVzJEgtysUR4fiEYze6AZ7gnnJZX0afYPsORF
	 gaINh7JGOtbCyf3dOBiUgEKH6ezjAjV19jmyYOhx8yYCN2hFHcsMH81TmxzykLFdRs
	 /myrgGgy/2VyjTt/a5GchaBHgckNiayogkYSkNOsTA3BkL+kuIbFXR/juh9vntN7Ca
	 CqNUsQlhDIJuA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net v3 0/2] net: airoha: Improve hwfd buffer/descriptor
 queues setup
Date: Wed, 18 Jun 2025 09:48:03 +0200
Message-Id: <20250618-airoha-hw-num-desc-v3-0-18a6487cd75e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADNvUmgC/x3MTQqAIBBA4avErBsoQ6muEi1Mx5xFFko/EN49a
 fkt3nshUWRKMFYvRLo48R4KuroC43VYCdkWg2iEbFTbo+a4e43+xnBuaCkZVE4uyg2ul5qghEc
 kx88/neacP8CIWb1kAAAA
X-Change-ID: 20250618-airoha-hw-num-desc-6f5b6f9f85ae
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Compute the number of hwfd buffers/descriptors according to the reserved
memory size if provided via DTS.
Reduce the required hwfd buffers queue size for QDMA1.

---
Changes in v3:
- Target net tree instead of net-next one

Changes in v2:
- Rely on div_u64 to compute number of hw descriptors
- Link to v1: https://lore.kernel.org/r/20250615-airoha-hw-num-desc-v1-0-8f88daa4abd7@kernel.org

---
Lorenzo Bianconi (2):
      net: airoha: Compute number of descriptors according to reserved memory size
      net: airoha: Differentiate hwfd buffer size for QDMA0 and QDMA1

 drivers/net/ethernet/airoha/airoha_eth.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)
---
base-commit: 0aff00432cc755ad7713f8a2f305395d443cdd4c
change-id: 20250618-airoha-hw-num-desc-6f5b6f9f85ae

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


