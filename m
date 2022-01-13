Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35292C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81joZZmFh3/unfWLaUV9AiEpvdG3lKw4yt0wSbk7Uxw=; b=MxqnneoPqtUNv+UIenIxiDYH5I
	1x7+RkvMDOMHhKeDRJFSKKoR6K7ftg5XD8cfONB8jbfThhwZDkIPHLd+trWAj39Fn3ii9mW/xQe2h
	BD0mKJQqZkKYAy8TXIzpdoRwkSaYkKRXrIVM14+tNEqOBjXbb0CavbJs9+eFssCh7U7DhH7HxjdP1
	DRpyUbwiXO0QeghIm7BQ2FnDVfbEFSQ4XCuIOCCCc+PQaWcyN5ZjTqfRTMlaQR60weVIC8OjphWkc
	0OG5pnPL7KO9/RCLrrpLL0jbybjC1T+veOs4fBISgD8Vf7W6Q/FPwzbQJ5oSqJDZV/8SUAaabEA5d
	GRwYDpmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n82gP-006Uoj-Ag; Thu, 13 Jan 2022 16:10:37 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n82eG-006TY5-08; Thu, 13 Jan 2022 16:08:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 13F0D1F45F44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642090102;
 bh=l3KQagUbPX/8dzNwAMFTYGee4gg0II9hxQ4x9DR7EoE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GnjZckDdctWoJBFgGNo/PN5SHoTo9YfL+UIkB+P3xJUbETQYy9bLJuuFFrtsrprIH
 fOXmTIIIAjoHQasumgAlWqfHcHMylJ39u7mvEJB+86e+zL3arKTLBrnyEAWO7ihZcz
 fLTHjhdQWG0zJryg3CfiOy1D5ahLZs0mXHeaf8ker6GVECqk74GSijWtEnVn8Io2q7
 NF02Sbt8GLEonsFNCfYZpRungxh8CVeGKOpoKAnQPw7Do2rU2kSkf5ndHDHDs8c6tq
 qQsAdPwoZoAo8W8o3zWcSZpzqFsyZXr2y+bx3RCrnXpdIuMrcur48FkCILUMjvMlrO
 zelsp8mcAtrvQ==
Subject: Re: [PATCH v11 06/22] soc: mediatek: add mtk-mmsys config API for
 mt8195 vdosys1
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 singo.chang@mediatek.com, srv_heupstream@mediatek.com
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
 <20220110084645.31191-7-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <0ce9149b-f2ee-ef59-12a1-ff7bc5cb4978@collabora.com>
Date: Thu, 13 Jan 2022 17:08:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110084645.31191-7-nancy.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_080824_255642_E70539BC 
X-CRM114-Status: UNSURE (   9.73  )
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

Il 10/01/22 09:46, Nancy.Lin ha scritto:
> Add mmsys config API. The config API is used for config mmsys reg.
> Some mmsys regs need to be setting according to the HW engine binding
> to the mmsys simultaneously.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
