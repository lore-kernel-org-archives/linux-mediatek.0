Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F13C7618A
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 15:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaY0Xl4jfnqhSvRMHOlCX3MBxMkltd1/bLTF73k4weg=; b=IDv1QugLRvdxQhUHgG1kLOuVYn
	xMShVn+UAOL2AHVXSs/cfnBmH8oaulwvObF6SSJbOqdAu42P9wa93/CGKUiGGR0cHGLBIuwjMOfs2
	F/VZDsgij7ryMEIXGu0ElDH4Jv5dn6nis7U96E1+4UCfhi4XP+X1CH3V4/rjbXx4fx2qqkn/0+Suu
	n7ySbozr3w4I7omc9/TkvZttO03vcDsRVMvfoRIOAbXYI0lQ3AUzL072DyOtoeOQHvReuSYYAy2cz
	ZAhOzPybmmRgLjaS1YI7OR9maZ0vVHneKFH7EOgOS4RBz9RbT7YeGSIdjQU7Sh2dMvenX9F8Y/HbJ
	snp+ILuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pduWF-006tNe-2v;
	Sun, 19 Mar 2023 15:00:23 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pduW3-006tI8-1w;
	Sun, 19 Mar 2023 15:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1679237989; i=frank-w@public-files.de;
	bh=FaY0Xl4jfnqhSvRMHOlCX3MBxMkltd1/bLTF73k4weg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tZJsnxpbx8mj1ojXRBCtyzKk/vRDE8bWU8MjIVkvmjWpFfcIpABLv21lwVAASEuRm
	 TzPiGxRYLFGFuqIqF0JT11RTJfWqbIQXwAmgD0EtdXjPqnSnVYONfXR/vdGCGLyXxq
	 XzgHAPHK/SCjuqyJvy85wwhEVkfEdS118OSbVAhP/ZsrbvMPpMuDE2RgH6z3WaBXPV
	 aSjIT3Suz8GO3ApN+Tn/SkzJUMdDj3rlxyi4G7CsRGUQ9fpj8CC4FZCht0Gb8FzKtw
	 DufBNMp2t8B1oVcjq0O/Bs+E8qEHyxjsMhoKhSJdi4fiYaxBopuIH+h1oKGm7tKKse
	 VR6ZOWNOznA2Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.158.68] ([217.61.158.68]) by web-mail.gmx.net
 (3c-app-gmx-bs27.server.lan [172.19.170.79]) (via HTTP); Sun, 19 Mar 2023
 15:59:48 +0100
MIME-Version: 1.0
Message-ID: <trinity-74490009-c9ba-4ac4-bc4b-8f613902f698-1679237988949@3c-app-gmx-bs27>
From: Frank Wunderlich <frank-w@public-files.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Russell
 King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang
 <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vladimir
 Oltean <vladimir.oltean@nxp.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>, Alexander Couzens <lynxis@fe80.eu>
Subject: Aw: [PATCH net-next v14 9/9] net: dsa: mt7530: use external PCS
 driver
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Mar 2023 15:59:48 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <a770f39662182c5dd494d98717820f5bd98a47e2.1679230025.git.daniel@makrotopia.org>
References: <cover.1679230025.git.daniel@makrotopia.org>
 <a770f39662182c5dd494d98717820f5bd98a47e2.1679230025.git.daniel@makrotopia.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:+v+uKNdg0PstN/8SJfDHeTZE6Mum0N2MMgrG6r9wnuu8npcGDS19dKHlr+4z910/kn4ha
 p6ZPtCdf0TmZg3E4qK5FcBtPlzrS/N4eAyK2lS2/GChhhBvhEq7zy9dfsQ5wjonj/O621mnX2nVW
 P6HnC17Z69WOF/6ZH8BLhr6d4itqShstcAC7fDzPiPn9HUoM+fqE4wADrnvqK9vL+pMKIHcn1gay
 cmahC8uh31l+ugPj/wP/8BqXU0JSEmsw0/8awGqQG9XOivmDQwplpaHFCOSKmsNYbxf8OvAF6s0K
 uY=
UI-OutboundReport: notjunk:1;M01:P0:Mv/Q0HQ28M8=;N2EnFaqiI3lWUB7Lb5ETkVJmKfb
 z4DGVQB44ibOLG7T5GpqgysxIbH4Oo5kinSx2P523Poyc++ir05S/w6xo71JzHtgLB1JLUr90
 zo/ujXaL/Hz7RhGywZE6IQ1yvtBhbnlbm8zu/wSeQfja3x/tSo3FpbEGL31cuhfYLaM5b2DWM
 p2vi3EyM21CLncvkSqho2R3Pqb78UIy5ZmwicqxBRvZQj75YDHaDyqQg6AAbx+Cv1tIz/rAwt
 ZhUXbNKe2RjlgugZv9m+msihYstPWMQG52Wbr9xZYcpA7kOnC+NkuPE078rWa1Ek8kBH+3BiR
 lEZ5VDCpwfzH2i5c5G/yivHTALvYMemTL5NRb8zlXWT8GGZzyRQlda1gTr4G8KLPhUL9Ek5T6
 uDrRMi33dYOiFyYVpVNIG7SPlX4lScbnGS1rtTbuUPlOgvpRrGDIBod5fEoFQf1s1upGIZY5f
 PCLvwaifHi8evBzNue7o9pyFJ+fEbFE/EetldsNN/JF/yP1yWkpX1MolED4eaQbjrEzrm+Xm1
 tM3BXU24wSDFekXHXNfA4GXtuncTERQyJnY1JArkkfQXg4sttwo01lbOGhRJdzhEz+ioARfv8
 6B7CA292RmUD4BGFRu3shaLzsu/3+RdhfiSgZxZbW+GLagh9wO9Ue6wFOLifCja7yAeKSehRE
 PiLSPL3ZkiPbbqQl9GCBbehJsr/0+JE/MfL1yDqFU3s776r8HjtnsrNzuB1cbCqryFxrqAPe/
 gniwuNT1hQojgeV2Zxdoh2aXlZMyZ8XP0DapQM/yIHHNWLCzi02sgQ+Y21vaqEXEzBSKfAIWO
 PqEQQlut0h/iiAWrT86ovVPILuK2tZ/evTWRSOBSvuvzo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_080012_000714_5CAAE301 
X-CRM114-Status: UNSURE (   6.31  )
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

as Patches are the same as v13

Tested-By: Frank Wunderlich <frank-w@public-files.de>

regards Frank

