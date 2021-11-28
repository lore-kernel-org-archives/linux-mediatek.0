Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2463EC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Nov 2021 13:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fk4r9W5Ur/BGdDi08KlNojkE0Ev4Qq2dQvQ5H/jvG4o=; b=LHaSSNngzbZ5L0
	7rLceZ1wC2lx4lJbuNUiMz+wL1zZy39XwsYby9NaD9QjsknpaAS7v/v7tCfxxK8MaGqyj6dorpYLO
	pX+AgfFvRh1x/kA84XrIUHmGMwdWuc+XeYLME6qalAjKvBf5SkFGHVVvOX1ISlnxe6v9OWU8D8rUM
	UGscfBKPB+c0OnhLJQUAvVoQsOzQPDT11xvlT5L0A2yFHqwy2RSF8udCOiRc1BSYxyuihNMe0K9g0
	xdahCNU0u63Q/VKCrccHDK9akNeG7kXDt5cSkTr5yV4pX6Sg9EFtTZjDXJzhpkzE66FjtLvz4+sFG
	rhDZJQI/QXBXto16GHyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrJoq-00Fl0I-HM; Sun, 28 Nov 2021 13:02:12 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrJol-00FkzY-DE
 for linux-mediatek@lists.infradead.org; Sun, 28 Nov 2021 13:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638104510;
 bh=KAFEF4nBqZSjJAHkByl3gAhKyW0iRheiGP4BsFsbc3s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=ElTuKILq+JPF1ppUBGWaIE8n2oiyj/P5xA3Gz8ybUlkP3zpVDYXoPw6efJSLr901S
 ja75BpsR1E7VprDP4y4VQpMbmLmBwXqnhXkyAMGk6LApmx+bzMhuYe9i4+OEnmoHuX
 emJLb7bxPRKsRddpZGJ3jzvjprSxKEWnHm1yhQ4A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [157.180.226.229] ([157.180.226.229]) by web-mail.gmx.net
 (3c-app-gmx-bap55.server.lan [172.19.172.125]) (via HTTP); Sun, 28 Nov 2021
 14:01:50 +0100
MIME-Version: 1.0
Message-ID: <trinity-b64e638e-f901-4daf-bbe4-669da3962cd0-1638104510657@3c-app-gmx-bap55>
From: Frank Wunderlich <frank-w@public-files.de>
To: Xing Song <xing.song@mediatek.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Xing Song <xing.song@mediatek.com>,
 stable@vger.kernel.org
Subject: Aw: [PATCH] mac80211: set up the fwd_skb->dev for mesh forwarding
Date: Sun, 28 Nov 2021 14:01:50 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:sXBK9O3DEe0u6NzXR8M133TOYbyKFZYcy3mc9Q8wM2a4TJS1Eij4B34cHduQysmsA6TI2
 USmIs+KZyf9WIeUk1XwU+MIHkN9sjaA3yJzSaY1ECVCRqKomdbOHk4IfH38T13oSNnHVdKHMlYQu
 b+gsxZ20g+XVGjnuD5iIyC7fLkyOmYXSg1Y4uAel8uWYuOPjcyUh4gboTFGu02GHSJtQzzQFiybn
 3skUzQoqXx7vJzwWYVG36Tcvxpbv+jVfJE86R7Fkn5hwPjXOjKDSQo9nx98y6RYrGwI7eR539Gpo
 uQ=
X-UI-Out-Filterresults: notjunk:1;V03:K0:OFx5dKGunjs=:y3OjPL4IMg1WunScyGKILE
 6STxlAl89B/BWggVLH4vk8jztqWY4LM2A8jdZ8Dz3EMnxCJd/UpcIi65Soz6RyIUPrYRSRrJH
 GhahQBKrzVsX03sGEzlsRL+hPnJz1snE5IixM/5MNWP/mrvRsbcRAUseSS/HmfOqYNRvjlQxl
 mvLrQJmmEtU1CAyvyaHDTRL9Iu9xET2AEm1/08mQieDjXO9tRhKI8UMLyBxIU2QU7+ORXLT3n
 0FlE89kEm7hXTYi4mElhnp/PXiMO1CA0Ik8iN3P46Jm7INAJVl1i24EMYPa984x142P7Akmc2
 k6cjZN4bVM1dL8Elh9LdbMN60im6dbIUyayj68UFWVa8D7Rctt4ve8Xr6j0tcyDTTrh6nzK9x
 nY+Ze4/gi6PIsrkNZBnzppkJyCc1xXZdijjXpfgz45FPGBj703km04LVC7n5Hp5xycNxRu0ek
 NSUlW7a/YkrupKNih4eV8IdVWFjN0LoQYqmPBaChadc8T8Nuzlgm7E30YdqcPxXouP9Ixt39v
 RfkIBUr918D81zBGpEex0r9WXyK2p3ZtImSQnlSCLZm9WY0vBJTxMGNXrK2T56mfEtVds2N6l
 plhjwaXJoS8JqPW5jlc8r1myI01pHT8yd+79YnaarvTf7THpMddXLN5dHKDUq9j9Vf7fuUQqY
 q2GHY92yRR37t/O72AU5OA1BuS4iXYTCpFG2u7kz2wRX8p4mNDlATJ2Ko0h0j1hEQca8mSpV2
 rkfKzeezRxmVkI0DzaaBUXkcDbNjgGy+da7ahi7xeBU4rDX4UlgeWJhfKZfh3Qq3zwGQfOjYl
 LzQZdoA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_050207_792157_FC5D9422 
X-CRM114-Status: UNSURE (   3.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

maybe we should add Fixes- and Stable-Tag to get it fixed in 5.16 and previous versions

i would suggest the commit introducing the warning shown when the skb->dev is missing

Fixes: 9b52e3f267a6 ("flow_dissector: handle no-skb use case")
Cc: stable@vger.kernel.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
