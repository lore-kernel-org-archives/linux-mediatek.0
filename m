Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC8FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 15:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gEMVjjD1rzKxU32prdPKJy9Z7XV19g+7ROB1YOOgUWA=; b=yXqw3GPe98veD2
	pThDB982UBoRul3fRscoWtUERzvZGovh+qySOrwZQCUkg8sJCHCAuZQO17isKvgzyhKP2ZjMqc4gY
	HeKr514dOefLZ5Iu5UJfTvk6rzojLnubGYxqfgRaLeXs01qZPiSws3edHQli9k0L21AIHoJ6sbKi2
	j/KuRJz1VxzG8SPlj6D2MwgkVBM7kLstZ8IwM8MmTbrz152WOba9cLB7TGIYJklvPfOFtPMhshMOA
	S71uUjayyeJzM6VPidlaa6zT4X0QbF8CDE3tfUumZev+KAqOjMp5MjGBd3KfW7978R3MJ5sFlQuPD
	Nk+o4yKr4hDGjLOIQzVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFdpV-001mjw-9T; Thu, 03 Feb 2022 15:15:25 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFdpI-001mbT-5z; Thu, 03 Feb 2022 15:15:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 762451F45D97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643901302;
 bh=TW1aAK4Rx2TvsCWhFDSwUvGsU7fwcqvdmrBfOTdWTGM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cEni7tQNqwQgWMW4WvILu5Oag+MjZ+84GJml47xoUU5wl1TExmuAF1FB9+6pwpTEy
 o8Q0c9AbZGURiFHL6R0SczE0SqsnaA5j+QzmEA1p1ukzsCLEpKSErvDHPf0MZZ5X2z
 X3ybpRIsaiewC2MnO5w+hQO4Kc+IUa774UIEXb5ZaR7OrxSYNOtO6ZZyXVNgpO1r3G
 Sfw6kPm1XOohabEv7LynUurobJM4XA3Sm+QqgLBqiVZMAUGl0A2PbHhumGUr3MIpzU
 nWuAFZf0t4XXJLCGvktD32gtdvfKYZVIVIAAKdHNX+l/hdxTb8svTI29B+dF+wI0jk
 QOst/Ydhf78Kg==
Message-ID: <21030007-f135-58ee-ecfb-8ee0fcfdf155@collabora.com>
Date: Thu, 3 Feb 2022 16:14:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [V11, PATCH 03/19] soc: mediatek: add header for mediatek SIP
 interface
Content-Language: en-US
To: Dawei Chien <dawei.chien@mediatek.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Fan Chen <fan.chen@mediatek.com>,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao
 <jamesjj.liao@mediatek.com>, Henry Chen <henryc.chen@mediatek.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
 <20210812085846.2628-4-dawei.chien@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20210812085846.2628-4-dawei.chien@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_071512_386782_37F98B66 
X-CRM114-Status: UNSURE (   9.14  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 12/08/21 10:58, Dawei Chien ha scritto:
> From: Henry Chen <henryc.chen@mediatek.com>
> 
> Add a header to collect SIPs and add one SIP call to initialize power
> management hardware for the SIP interface defined to access the SPM
> handling vcore voltage and ddr rate changes on mt8183 (and most likely
> later socs).
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> Signed-off-by: Arvin Wang <arvin.wang@mediatek.com>

Please sign-off this and all the other patches that you send.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
