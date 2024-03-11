Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1827DC5475B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 11:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:Reply-To:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vPLARyQyZY9trblFdEBXjcULBwg5U1G32eRo2FaZfxY=; b=r52mwikrSWv76E239QG+SjQzMk
	DlRSdWNlnqd40GttLLfqLPqMFFOLRMr5zQ4AGfTVjxMTrx1R2HFVnJnPDIWIzs0grYufl/RT8o/F0
	LdSeC0me6H7Q3YWJFdY86vAADyATkYSlxeMiz5J/aFPzBtl3M/EDTXYhmzi1UV33cMukruXnl6Rle
	PmUh+9qz5GfHULnBGCL1g/fOUV2b4nkUKrrK8IgH21WSZ9x1C4lSWriCd9jjSjpaSpUo7gjZ5GqzK
	JNOZqR1hPEz9Jc6JCbv/+kMPKlQhc9IJ/DU6cBzCSLV6VYXzQLcY040vEB7/edwPp8WMZbW1r8mmS
	xS5ZzATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rje7U-00000001LWR-0nm7;
	Mon, 11 Mar 2024 11:47:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rje7O-00000001LT4-3tn1;
	Mon, 11 Mar 2024 11:47:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2B6760C67;
	Mon, 11 Mar 2024 11:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89A83C43390;
	Mon, 11 Mar 2024 11:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710157616;
	bh=90OLEsdfJqu8wgRSuSRNabsqq0MAYE6rL2NiXmGoMtI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VYpt5aJHczmPPrIB9JAWhU9Y/Ur747KX42t9XfhPEtXzrzrXWOFeCcsqEysu2RwcT
	 IIb1bHjnYr6JZ1msidcECoTRYSwU5HSkMV2a8Noj4xfR5Y99ko0e5sFbE0hCPZE+ui
	 L19WJ2xCh67uvrIlqp0WUS5zPhRHW/C6N4peZ7nB/GnZKvOyiQv2wTnfHImdXrReMP
	 4Bi3q0Y+TbOBy4n6myqieKfOXW4FI/pm7Ze5j3D0wWnrSSgijZurozcPJoyO/C8ymp
	 cFcMlw7HYCxwy3H09iGhcDah7o/Gz1lg1JqniOxwC8fw8CjUTg7yWlUQDYXDnCFsmM
	 hGbm9MRdgnkyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754B0C5475B;
	Mon, 11 Mar 2024 11:46:56 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Subject: [PATCH net 0/2] MT7530 DSA subdriver fix VLAN egress and handling
 of all link-local frames
Date: Mon, 11 Mar 2024 14:46:37 +0300
Message-Id: <20240311-b4-for-net-mt7530-fix-link-local-vlan-v1-0-d67e6cc31af2@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB3v7mUC/4WPwQ7CIBBEf6XZs2sKaks9+R/GA1JoN1JogDQa0
 393U717nJndeZk3ZJvIZjhXb0h2oUwxsBC7Csyow2CRetYga3msZa3wfkQXEwZbcCrt6VCjoyd
 6Cg/00WiPi9cBtWts10mle9UDd83J8tnGuQL/wo3NkXKJ6bWxF7FFP4z4jymjLkhhSDbnL9ORL
 zwmDDjHVNgUKFApYYTpmrts3UVzarq9iRPc1nX9AFLj/gX9AAAA
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710157606; l=737;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=90OLEsdfJqu8wgRSuSRNabsqq0MAYE6rL2NiXmGoMtI=;
 b=yEjWff1QAaQVlCGNmDywGXbrJAoO1e6BjBXW4cIqriDctnD1IsQi0KcTnd5CM7arX36Tysqkm
 AJv5bSCJiDzDPFoDPQKux05QW1mtLNNtQ5FjXY+5dgkjdGDyHg95tCA
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_044659_122531_BB9B8A7F 
X-CRM114-Status: UNSURE (   5.16  )
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
Cc: mithat.guner@xeront.com, =?utf-8?q?Alvin_=C5=A0ipraga?= <ALSI@bang-olufsen.dk>, linux-kernel@vger.kernel.org, =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi.

This patch series fixes the VLAN tag egress procedure for link-local
frames, and fixes handling of all link-local frames.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
Arınç ÜNAL (2):
      net: dsa: mt7530: fix link-local frames that ingress vlan filtering ports
      net: dsa: mt7530: fix handling of all link-local frames

 drivers/net/dsa/mt7530.c | 52 ++++++++++++++++++++++++++++++++++++++++--------
 drivers/net/dsa/mt7530.h | 22 +++++++++++++++++++-
 2 files changed, 65 insertions(+), 9 deletions(-)
---
base-commit: c8a5c731fd1223090af57da33838c671a7fc6a78
change-id: 20240208-b4-for-net-mt7530-fix-link-local-vlan-af6e9928ad8d

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>


