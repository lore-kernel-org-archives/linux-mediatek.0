Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9B2CE7D08
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 10:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l4hYQn6Lz0R4jGWmYX9NZU/EQB48y3IQ8PRy7OO8ITY=; b=urZTNy2DfEIKU9
	0sZKz7xk77GOIqxS5kp+GIhGvfltisRuKU2kNvP7fvkm/CY++YtYXMehG72mQCSfSf5sGaI3oKd3u
	BgItVMzQaLymOyim+slQwVJeQ9cWUXnmJTKUaGOCP96VUXZeVitKT28VIEzQUbMNUoydH+cl3Y/+T
	T5L1+5CtWtcbh6y608dqQFQ/tOv/AHa+2g7yt24YZKYpHh8zIvAPlDS8wdEraiPglaYwJJ6eKWzZM
	xzxtJe/aOYjJmMhHonoiKL0aRFiBPdEFdnBZ/enWIXLIUdqeRaddnx8+hk9Rcp1WJrWW6T50A0FXF
	MuzTMbtGaP7FgdMeu9FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svZrV-00000002JRS-3amY;
	Tue, 01 Oct 2024 10:12:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svZqE-00000002JGM-2iZJ;
	Tue, 01 Oct 2024 10:10:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B45245C032D;
	Tue,  1 Oct 2024 10:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF1DC4CECD;
	Tue,  1 Oct 2024 10:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727777449;
	bh=PQvz2OTl7+pmW7TEaHC3UE6z9ZKgTtlcsgx/ouMCEu4=;
	h=From:Subject:Date:To:Cc:From;
	b=jmzj8KAmkEn9UsRjQyXBxPfT2z8puBdMbmD/0qvGd5MN5QrCeuk9F+RnXbxhhVBc+
	 23Ggy7+qxQOauyeOh3XvWwxLH4BD/fyF0f1h4AZVXqNlm3Q8TDPQSCBA6YljOUuObz
	 14KV7ryYgrlsKImH4uuuq/TMnuSG7keWYm/1w7blI9PcphV1KFCy3j0xTHCrGHiFuA
	 ZcntQQugL/ekuazwqVhyjlHPV3jP4n7zeqfyO2mGPFWZW9CsAHpxbsPcZdx1pZIBH9
	 3tb4hDflDpJ43mbRcBLl9tJqn7ySOkLPtBLQ8TWb1l5jO7N7uWulHXsJJScxzl6xKu
	 A9mRqvISQ+ZBg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v2 0/2] net: airoha: Fix PSE memory configuration
Date: Tue, 01 Oct 2024 12:10:23 +0200
Message-Id: <20241001-airoha-eth-pse-fix-v2-0-9a56cdffd074@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJDK+2YC/22Nyw6CMBBFf4XM2jF94AJX/odhUeqUTjQtmRKCI
 fy7lbh0eU5yz92gkDAVuDYbCC1cOKcK5tSAjy6NhPyoDEaZVnXGomPJ0SHNEadCGHjFYJXVtiX
 lfYA6nISqPqL3vnLkMmd5Hx+L/tpfzqp/uUWjwtDqYIK9uGHobk+SRK9zlhH6fd8/PunkgLUAA
 AA=
To: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Simon Horman <horms@kernel.org>, upstream@airoha.com
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_031050_763880_16552718 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
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

Align PSE memory configuration to vendor SDK.
Increase initial value of PSE reserved memory in
airoha_fe_pse_ports_init() by the value used for the second Packet
Processor Engine (PPE2).
Do not overwrite the default value for the number of PSE reserved pages
in airoha_fe_set_pse_oq_rsv().
Post this series to net-next since these are not issues visible to the
user.

---
Changes in v2:
- fixed commit logs
- Link to v1: https://lore.kernel.org/r/20240930-airoha-eth-pse-fix-v1-0-f41f2f35abb9@kernel.org

---
Lorenzo Bianconi (2):
      net: airoha: read default PSE reserved pages value before updating
      net: airoha: fix PSE memory configuration in airoha_fe_pse_ports_init()

 drivers/net/ethernet/mediatek/airoha_eth.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)
---
base-commit: c824deb1a89755f70156b5cdaf569fca80698719
change-id: 20240923-airoha-eth-pse-fix-f303134e0ccf

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


