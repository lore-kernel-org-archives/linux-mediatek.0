Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8BACCD183
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 13:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YZt7y+C27rWuT01oK5a48gIrXwMOpRzW5GVP+yN2dSU=; b=jHPsR+PhMukWty
	kmXjlztnqsqA4ET5vvC1VnwFbBan8cwR2dUrbWbGml/qnNcuqf+E/9cB9CzKCPFFwS/62bzjilNwb
	RIRM2K4GmHSov3C6+6/FfXzbvJcx0jsjH9lJyu1i60amuttFhAzOMRIzLecNMY/ldR28w2rVd5ljn
	U+6ICzcN9gIJXyDv+bNxCac6E3MIOkf4gPABBxphGXz84Zk584m6BBiqa7oYFHp/n/Saxc7EoQCa2
	HvpKMenWioiGFNCjMmcENxe40yZEXf/g6VEtorfynIH1e67ahBfidjJXcBae+4lUm9pH7mYgAw9lO
	VwF6xWHCv1PAbzddBLvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8J4y-0000000DHrY-20OC;
	Mon, 13 Oct 2025 13:59:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8J4x-0000000DHr1-1Axi;
	Mon, 13 Oct 2025 13:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 82294612A8;
	Mon, 13 Oct 2025 13:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A45C4CEE7;
	Mon, 13 Oct 2025 13:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760363950;
	bh=OQF+uf4SEvxYvmb15IWXMVY/5y/3pewqBdXN6tQkC3E=;
	h=From:Subject:Date:To:Cc:From;
	b=AQqCuYviYzysF6VFw8wkJCpJZyED/68w5OqTamcwnD8W5K5DbDVqXZJMEw8NTGfLF
	 a4d0BW2V9f4/ydg4/aJfUI//r1Wi1Lc6dmRFlIi45SG+HY5LBimIH4rVtTG0OYAkzo
	 6YJzoOIm7nB3Jr40jzeHR6h1lcT1e56pFUeqfaRnwfn6lw2r2ZYu3Ftoyedjg0X6oI
	 nBJ95LN4uXtUcMmMQRd38ng+bZXBVVd8mBwBFWGGn9uIcS26nVNsxqTKkaufmXFB4l
	 dV9MN4sGeVyuhJRAUlfOVIFtV5v/28o1C64gviMETafaD6M0f5MlRyraX8aQJqMioa
	 Lg5KPq0udO5Fg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v3 0/3] net: airoha: npu: Introduce support for
 Airoha 7583 NPU
Date: Mon, 13 Oct 2025 15:58:48 +0200
Message-Id: <20251013-airoha-npu-7583-v3-0-00f748b5a0c7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJgF7WgC/3XNTQrCMBCG4auUWRvJf6sr7yEuQjppg5KURINSe
 nfTrhRx+X4wz8yQMXnMcGxmSFh89jHUELsG7GjCgMT3tYFTruiBa2J8iqMhYXqQVnWCaIGSCcq
 0lhbq1ZTQ+ecmni+1R5/vMb22B4Wt63+rMEKJlC0q5L2jXX+6Ygp428c0wIoV/gm0vwCvADLuj
 FXWInNfwLIsb/u+z6XwAAAA
X-Change-ID: 20250926-airoha-npu-7583-63e41301664c
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

Introduce support for Airoha 7583 SoC NPU.

---
Changes in v3:
- Rebase on top of net-next
- Link to v2: https://lore.kernel.org/r/20250927-airoha-npu-7583-v2-0-e12fac5cce1f@kernel.org

Changes in v2:
- Introduce airoha_npu_soc_data struct and generalize firmware load
- Link to v1: https://lore.kernel.org/r/20250926-airoha-npu-7583-v1-0-447e5e2df08d@kernel.org

---
Lorenzo Bianconi (3):
      dt-bindings: net: airoha: npu: Add AN7583 support
      net: airoha: npu: Add airoha_npu_soc_data struct
      net: airoha: npu: Add 7583 SoC support

 .../devicetree/bindings/net/airoha,en7581-npu.yaml |  1 +
 drivers/net/ethernet/airoha/airoha_npu.c           | 93 ++++++++++++++++------
 2 files changed, 68 insertions(+), 26 deletions(-)
---
base-commit: 18a7e218cfcdca6666e1f7356533e4c988780b57
change-id: 20250926-airoha-npu-7583-63e41301664c

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


