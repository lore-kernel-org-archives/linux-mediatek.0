Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C379C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 12:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpzyhUJ9Y0f7IwiWbmpQBCJuZv8RNZFIDmc4HT5W5dE=; b=mjsdeYiGwEnI8x
	2621h/lN6KYnQzCDYQq4k4ypv7JIuHqjs05o4dt5OPuoWsdA8m4JLNa0KOPpF4B7Ll5XUpJOfF8ZO
	/Zwqgoufl8235wVaKs8T/BMe/pTn+VUXdPET/x9AKQdOlj4UCINTG0F+CAAxTU3S0NatYYhGYw8lv
	AnKeEeMUigMpCGASQBz2GiUunyQ9XPkDb1Ki8O/RC6iCIa5vh9q21Qng4kbTuhoad1lmJiP0YylSp
	azLP+Y+yXCD1s0/8d3aaWslu6ny6nRiojxtf7EBJGyHxiSiG9BmBJRyfzdeug7h4hE60c/FnY9Be0
	+ftwL6Gwmf8WJo9DpNig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlrV3-005ijb-AF; Tue, 03 May 2022 12:19:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlrUh-005iYY-S4; Tue, 03 May 2022 12:19:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A75421F440F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651580346;
 bh=0L9QYyKQP4UKYOIU/t2r/ePKygeEbRIhjmxvtJB1nsY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e93BsPlwcyqrlux8DndbUgg2m8B8Wp3ZMFLqEc4IXKrtjYxRII/iRD3JDd8gmsvaC
 B65TNEimBPXt1lUDxu8RXccuUEFhThBNoO82g2B/kdpRk/DsPc0TwiTHsaDztyEbfU
 pMuYXMwJ7QqKk9Phhvq5reIDY/XRY/qzYY9V9w9d5h0Ow3rh9zr/j2hYtcLvkSvqpZ
 Egpv5cc4filEqdOcsDzCGrR/FrzgJlfjj0W4T2QbwHG2n/5/g6xdBxhp39OzGJO/T3
 eOXD/q8LYwptxNHEI3OqSwVAQ1P5XNla4Kzlh5F/ysX8ijKXoew1E9HQtMfPi83dGL
 2Ec3w/9UPtJVg==
Message-ID: <8c7c8c7d-840b-30e6-7b2b-341713385d1a@collabora.com>
Date: Tue, 3 May 2022 14:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v19 04/25] soc: mediatek: add mtk-mmsys ethdr and mdp_rdma
 components
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
 <20220503102345.22817-5-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220503102345.22817-5-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_051908_082743_E4D01443 
X-CRM114-Status: UNSURE (   6.67  )
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

Il 03/05/22 12:23, Nancy.Lin ha scritto:
> Add new mmsys component: ethdr_mixer and mdp_rdma. These components will
> use in mt8195 vdosys1.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
