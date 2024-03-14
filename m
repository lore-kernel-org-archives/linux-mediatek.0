Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B7CC5475B
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 09:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:Reply-To:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wKXpJc7rnbCTikhjSUjlBzTaV70fUwDFA2NEmNe6lcU=; b=Eo0r60sKuFjQNbO6r1o4AoBsJb
	LwfmrjysHWNt9npgr0kI4pw4q/nbpo/tSG6lO10BiaN554KKaWiG5mTvVLH5uCJVQqujtc+P5uGM1
	udaH4aGgA3j+wHMz8e0/U2L+KOSRC3nHUlNwVfyAQ4rYpX1D9xcWmBEt8HVWrCKBluRYJRniCJHSb
	BqV1c/aAMR5VKD63569PN1PSw661nVbSLGJzy8Md4lFV3WcfZaD7K5yWl7f60cAPy8QfzhbPMmkYz
	c5UirM7smt2eHtNR9t8R6zy9LApAa88E9p0+xOx6Ez05X/s3AncvVchQuiTjOLd8vGgrlBefIq2KH
	NRbL1sUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkhTT-0000000DkHF-0ijY;
	Thu, 14 Mar 2024 09:34:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkhTO-0000000DkFC-0y3o;
	Thu, 14 Mar 2024 09:34:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 961E061546;
	Thu, 14 Mar 2024 09:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32FAFC433C7;
	Thu, 14 Mar 2024 09:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710408841;
	bh=9mhCWCDlcnDok55dMpIkq5VniwCLfhOjl6RgA4AYQZE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MCnH0QpQUiqNk5MbW8LitdIJrZknAqk+6T+0xKk3iQd30FtUa7Q51pkVtrI/VmUaX
	 ++swNz2GB7+O8NrEr6z5FsJi5dYZGvmMluOKrmHHYjvmTy1OprE28Z6HM4XlVQJs45
	 i1ymp0+e7GI2gwr2W+6LPHX0eEUS8OS4xV6aQswAxZGrwtPwdqztzP5UZiv1bEyevw
	 i/Ozkz2+H0m4MQ5v3da/D61DP5a6cgPQAzKLtLZgwLLJSLXDtpayIRahwiNha9rlG7
	 lfdQgW1yKkisWcw2EzmoPZteMhtTCRDfGHj3ARZCLqyfMV+Q6v3Ck5q+Y05eXJaHSV
	 zxnHYe7gyv6jA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F7A9C5475B;
	Thu, 14 Mar 2024 09:34:01 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Subject: [PATCH net v2 0/2] MT7530 DSA subdriver fix VLAN egress and
 handling of all link-local frames
Date: Thu, 14 Mar 2024 12:33:40 +0300
Message-Id: <20240314-b4-for-net-mt7530-fix-link-local-vlan-v2-0-7dbcf6429ba0@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHTE8mUC/42PsW7DMAxEfyXQXBainNpyp/5HkUGRKZuoIgWSY
 DQI/O9h3Q7d2pF35D3eXVUqTFW9Hu6q0MqVc5LBPB2UX1yaCXiSWRltjtpoC+cjhFwgUYNLG14
 6DYE/IXL6gJi9i7BGl8CFnsbRWDfZSUnWtZCs7Zx3JbfqJOLCteVy29kr7tYPBv/GtMU14DQXq
 vWbGTg2KZNmuObSRERAsBY9+rE/myG8OXH9+Ozz5eunndUh/rOSxGmY+oF67zt0wfyOO23b9gB
 GDEZlTAEAAA==
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710408826; l=912;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=9mhCWCDlcnDok55dMpIkq5VniwCLfhOjl6RgA4AYQZE=;
 b=y/QfBdILr3tdHqFe6w7wGfGuQGVjFvZrcg4u0T/fFa3h1BUIgOjuuuXeBdd6fANNjkg6S27HI
 32sFVY83Ud/CBN2QrzvqGPZcCgmRDlDRtwQ6BrugfSb40Y5/66jD/rX
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_023402_386249_DDD2E9CB 
X-CRM114-Status: UNSURE (   5.42  )
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
Reply-To: arinc.unal@arinc9.com
Cc: netdev@vger.kernel.org, =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, mithat.guner@xeront.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi.

This patch series fixes the VLAN tag egress procedure for link-local
frames, and fixes handling of all link-local frames.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
Changes in v2:
- Add Fixes: tag to both patches.
- Link to v1: https://lore.kernel.org/r/20240311-b4-for-net-mt7530-fix-link-local-vlan-v1-0-d67e6cc31af2@arinc9.com

---
Arınç ÜNAL (2):
      net: dsa: mt7530: fix link-local frames that ingress vlan filtering ports
      net: dsa: mt7530: fix handling of all link-local frames

 drivers/net/dsa/mt7530.c | 52 ++++++++++++++++++++++++++++++++++++++++--------
 drivers/net/dsa/mt7530.h | 22 +++++++++++++++++++-
 2 files changed, 65 insertions(+), 9 deletions(-)
---
base-commit: d7d75124965aee23e5e4421d78376545cf070b0a
change-id: 20240208-b4-for-net-mt7530-fix-link-local-vlan-af6e9928ad8d

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>


