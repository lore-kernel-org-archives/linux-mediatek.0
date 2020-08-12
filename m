Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5FCC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 10:39:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB4D220838
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 10:39:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IHSUj9zC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="HDREbg1n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB4D220838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wh6XndcZH94u9xAzq1zejcK/njP1lKfdzNn0D2JuXsY=; b=IHSUj9zCx12taApvPShQPxezr
	rXrXcGp4Bjtgjv9e8/xxho1Ps9NPwciXlShIpcyApfrKj5O+GpfFQM4jEX2tUDfo3oT/chabCaelj
	4tD/U/Z3KxjNF0XGBG/Lf3P4MbEJiNw/oK50KFDn8ufFVtDEC6QoT90ZiD7CcY4yn5G1uhfbHdmUe
	l7otIHnwRKmKzYaeSYMAoLQHd/5TQN7B46saZ+H/DJIUfEexFl2b4myRUiwMG/gKZDHhHPcmi6AyC
	+LeLM8y7kZPRTyHx7mZscIZe6zCJHbvkDC0tf7slw0VQksBoxjZwwfDmlneDcflmk7uVwYKInehdg
	nLHPGHu+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5oA6-0006Jt-3Y; Wed, 12 Aug 2020 10:39:14 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5oA3-0006JA-Hb; Wed, 12 Aug 2020 10:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597228748;
 bh=kyxDKOrNtFwAET7ssBuwQAdW/EMV3Yiruqvshw/MQC8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HDREbg1n1mbzjSTsq9++sj0iWK+zpchaw9+QfOAX6gpqaqNiE+4aTncQZAF/ya2U1
 PpUcNElOw4NNEoAQ1wodLvKgrHtOsbSoV4edqbjoT4ZYHFS3w3hQqqGOjN2agk3teH
 6OCtM1xoInrJUCvAKJ9zPO+6NwNqhO/82Qd/hweQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.53.41.139] ([185.53.41.139]) by web-mail.gmx.net
 (3c-app-gmx-bap56.server.lan [172.19.172.126]) (via HTTP); Wed, 12 Aug 2020
 12:33:41 +0200
MIME-Version: 1.0
Message-ID: <trinity-a4a4e709-ca8d-4867-8f90-d0ddbfca05cb-1597228420620@3c-app-gmx-bap56>
From: Frank Wunderlich <frank-w@public-files.de>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Subject: Aw: [PATCH 2/3] arm64: dts: mt7622: add reset node for mmc device
Date: Wed, 12 Aug 2020 12:33:41 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200812093726.10123-3-wenbin.mei@mediatek.com>
References: <20200812093726.10123-1-wenbin.mei@mediatek.com>
 <20200812093726.10123-3-wenbin.mei@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:gfeTfH9cl5G8lIBSMXcX0ttEubv7Ajx1wwPT2iBKRJ8x3w1qe/q3Aq2pU6G5w045XTeaU
 X3ie2/s10R6kks7/xbD1Thbuozc+5ABCC2Am3V7c0VHKbNgHXHKbBPCnlOP3yA6NpDTgQGfnLfXq
 mt68050gHBqeVdojky2SpvZFPnuyuXuTIKNpYZQDJlmALzYVzEsr7oh5nBHW3UOVkKg9+6w/Yd7C
 mosrh9PR2Acwn92c2U2/n4y7rw6QPDbkY6e14wwmYMzPyk45sRS9ZKLVepc6Kb+jqmWobwfkqN7j
 Zk=
X-UI-Out-Filterresults: notjunk:1;V03:K0:jvildI3w0v0=:4hSQVfEjgPpt0gsgIWHvlt
 yXI5meLFxWBXD/s+Tzm/rGTRAKXGUg5x68XhTF9/yb1cpLoCia5XJn3PbhRFH6f5DoNzpA1bg
 3CQ2DOWdXtzmZBe2O8N96ETPo3jq7iXvpCK71L7DaxHm9LC5MaJTVB7/qTQCEDmbxPtVhh1+4
 AHXwJ0mArNYnb3Rb94rXqEoSekwGOePS7PAGliQYb239WZZAu+Sv27Vpz5A2tZOY5iIIjz7O8
 qq7LK8i4aKu4R1CqY+ad02/P3JCBDC7KNjGPe5NYZN5SkWG3Ul1a+Zf6q/Xm8TvvwYfP81xM0
 MclBa0lDH7C+ilIFqUJ/okh6gV2SXtXyxu8TlFiNKn1M2wynn0JK1nn2ONqcSCJ7iy5ma238I
 0L/u7D9KSffpYFtQz+c0yW8dF0BZsWm4Y+BYVmbQC5Kvd1gbef79NRe0PbH5gXsNUzf2eTA6f
 iKlofjsyzwAdNetOg+kn/IOTEXfae8azmHqvmsnQ0sNUfn74OWe1a+HUmvriiss0Us8JtsWjE
 H1jlWxIpaA8XhrUCE0W76XjxUhrGML/y8YeLk68JlWw53WSo+oP8sdu7FSh7xn1GAwpDTh6qd
 Hag3hZmkAdr25OD+GTjxhAux275YQQ7Rp/Yc+kvGvuLJVUbIGWAVY4KKMjq7xU7JPDdBQIKBr
 tDEgjNJ9RcL6VZe8bNBhe+OTk8kwo3wvzFRlxNEmlNav7v937XA3sxlML0qgoayDNNyQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_063911_790722_79DF4DEF 
X-CRM114-Status: GOOD (  11.44  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Wenbin Mei <wenbin.mei@mediatek.com>, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Mittwoch, 12. August 2020 um 11:37 Uhr
> Von: "Wenbin Mei" <wenbin.mei@mediatek.com>
> Betreff: [PATCH 3/3] mmc: mediatek: add optional module reset property

> This patch adds a optional reset management for msdc.
> Sometimes the bootloader does not bring msdc register
> to default state, so need reset the msdc controller.
>
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>

Thanks for posting the fix to Mainline
same as 3/3, dts-patch is also needed for fixing eMMC-Issue on R64

Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
Tested-By: Frank Wunderlich <frank-w@public-files.de>

and it needs to be fixed at least for 5.4+, so adding stable-CC

Cc: stable@vger.kernel.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
