Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04B2C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 07:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70/gSCKhTQzKbFYmgOhODv9+xC9MexRyBoezoF0q1aI=; b=WMDc/Q+wd7Gi7t/uJwlEqp5t6C
	60d19r+TFufJe3plm6r9IFVgkM6+DmPTKHg1fPbhB9LbMRrJ1gsa/lhW47VFcIekIwaZF5W8UMEov
	0GdoYe5n3xbYDpRHnMH/G18dbdizrWGeP0CjCw5RBkKTUNop9T1ZCkhXLrFXNAxlZWfidcVqLsOdS
	M3WL6LosG2bSb5nMZZa4coSWfJYF8m0VBADBtGpIjzuZmkjuQ9dzUsdsqTzb0LNjJmY21/YQ1xqNo
	PB0WFwGg8nvJBNqESvYAfplGdYmm4c2Pwh3oj4z76Cmu5UfDMamxB+FVkummJG++YBFVrPx0o8QD1
	yK17EdJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB9hY-006qHd-71; Fri, 30 Dec 2022 07:21:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB9gl-006pqj-0J; Fri, 30 Dec 2022 07:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=70/gSCKhTQzKbFYmgOhODv9+xC9MexRyBoezoF0q1aI=; b=BDcFvT4RWe8vnoSLmMOCOV82fV
	1NAS+tyAKlzcfGsmyy9Y9FtyIhtzlkVxR3CBoPqKvLCvWd++o9g/f4CroowEx4uAs8061MNGl0WEj
	bqUzh8BydU+C2cRqFj39ljNrJzMJ0DMv/yhnXOPUp+HjxUV2EaNc2dKSWP67lXCk1oLSjl6KrqLe9
	2hWVdotV2Wodjq1+TcbpJx6tPP5ZY/8b5h04zA0zGDj6JueabdOcnhSoMzczJwdrWIfYg487PHUlm
	Qo3nOGVFP8mKl+lW+XXmBzroq6+qiNliq7JJ5vmj/G0YBhrIg8D2X42+p5Koij4q7juex7enVjSrU
	b0W3Qc2Q==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pB9ga-00Gkh2-1N;
	Fri, 30 Dec 2022 07:20:17 +0000
X-UUID: 62ee3d55ecb749d0a07bc030e4e8cf12-20221230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=70/gSCKhTQzKbFYmgOhODv9+xC9MexRyBoezoF0q1aI=;
	b=rHvLB2LpblGbYspgogHYKDPwQu/5j3rFhQhraW/HxfE7Tn/BQIMVqXM1myrP9jwGgenQkMl9iVsq4Om8zAUVTsz1rCDldCEA297M9Eg3UmMeX89uiBUl50mR2t6nyaNtmz+xnqXoCV7ZgUVV6v3KfH8PqJP4+6CRIlSHM2osFCs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:eb18c1c1-7a0b-4757-9cd0-31ad72318539,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.16,REQID:eb18c1c1-7a0b-4757-9cd0-31ad72318539,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:09771b1,CLOUDID:516262f4-ff42-4fb0-b929-626456a83c14,B
	ulkID:221230141313VZASS3OZ,BulkQuantity:27,Recheck:0,SF:28|17|19|48|102,TC
	:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0
X-CID-BVR: 1,FCT|NGT
X-UUID: 62ee3d55ecb749d0a07bc030e4e8cf12-20221230
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 351029809; Fri, 30 Dec 2022 00:19:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Dec 2022 15:19:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Dec 2022 15:19:12 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
	<daniel@makrotopia.org>, <devicetree@vger.kernel.org>,
	<fparent@baylibre.com>, <ikjn@chromium.org>, <johnson.wang@mediatek.com>,
	<jose.exposito89@gmail.com>, <kernel@collabora.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
	<miles.chen@mediatek.com>, <msp@baylibre.com>, <mturquette@baylibre.com>,
	<nfraprado@collabora.com>, <pablo.sun@mediatek.com>,
	<rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>, <ryder.lee@kernel.org>,
	<sam.shih@mediatek.com>, <sboyd@kernel.org>, <weiyi.lu@mediatek.com>,
	<y.oudjana@protonmail.com>, <yangyingliang@huawei.com>
Subject: Re: [PATCH v2 00/23] MediaTek clocks cleanups and improvements
Date: Fri, 30 Dec 2022 15:19:12 +0800
Message-ID: <20221230071912.18135-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAGXv+5HqLc2xsz6b_d5hrPiAu363aMcJkQrqX32ukA2pcsj6kQ@mail.gmail.com>
References: <CAGXv+5HqLc2xsz6b_d5hrPiAu363aMcJkQrqX32ukA2pcsj6kQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_072013_401521_C52DEDF0 
X-CRM114-Status: UNSURE (   7.29  )
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

>> >
>> > All of this was manually tested on various Chromebooks (with different MTK
>> > SoCs) and no regression was detected.
>> >
>> > Cheers!
>>
>> I tested this v2 series on mt6779 and mt8192 without any problem.
>
>Please give Tested-by. :)

Sure for v2 and I expect a v3 series (I will newer series)

Tested-by: Miles Chen <miles.chen@mediatek.com> 

