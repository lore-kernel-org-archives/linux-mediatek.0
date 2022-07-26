Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72785C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 08:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72l6pWe6hH7CDY5o8qzqPFWi8/TIs4mShHnZ7ks+/vU=; b=WNDKAEzBpb94C/E8ZLNY7WbYdy
	gxdhTYctWFb29le1nVMBVF6MmmelUtTzP9t0r/XnpY5HIq65W8Imna1VAwAh92jc3B0hkljPxcLWI
	9xYCZaoOvpSW8GCG8ZXdCOFzWirkQjnzMJPGT0OQ6nSGlIKkwVIpdlii2hpyvGW9saJHjeRt8WIP/
	BVSuokZ5DJ5mwMG2S94w4uV1TmDgQKW3bSIOrzWdPTYWTfb+4cuWYs5U9EEIXrGjfT6c9AsRlSiRz
	JCJGVRDuBrutvbcmiwWitLx7z2gQQYwXlxGRGRa0FCd/XSg/n7BNQC25LBVv98eJajUAULFyBOEIR
	V51LdrUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFbD-009tQt-4W; Tue, 26 Jul 2022 08:07:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFaI-009sYP-Cb; Tue, 26 Jul 2022 08:06:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 401B46601B12;
	Tue, 26 Jul 2022 09:06:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658822789;
	bh=V4q9an53+VA/B3evQ9SvdQUfyyP6yPDm0/oyPI0irOU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nvRhsvCYubPB0OGwBVjqIEFGz8dfwOhTsj6jXsvav740OjHt9YpLET8OSp3VasgMH
	 7JYlJFLfQg3dTqqq9EHlbwIh5kMfuQF1pZSDpFeJHuW4fP9RPDc835/r99iwYQKiSE
	 cN41WW7En5sjwP/ToZcnNC9qr2ihUTGvkjueJm7ZxBwPu3SioTx7sKQh8KlsQ6ZVXw
	 5MWL6MiP1sflyIp8aCeeNqNvrVP+/vCskNVcDwjOw2vOJDI8HM2vGLcv1Ebct/XA6B
	 UIkPvj4xBuQ0wlCHQf+yYPpwtL1Paa30LTNiqzkUeqcJsqb/3VdZ6FvSQe7zmQvTRp
	 v2cVfaEex0Dow==
Message-ID: <66c19c92-d4bb-e9eb-3938-a37d2c3e042a@collabora.com>
Date: Tue, 26 Jul 2022 10:06:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] dt-bindings: media: mediatek: vcodec: add decoder
 dt-bindings for mt8188
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220726040155.17206-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220726040155.17206-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_010630_601967_93B8E0E6 
X-CRM114-Status: UNSURE (   8.33  )
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

Il 26/07/22 06:01, Yunfei Dong ha scritto:
> Add decoder document in dt-bindings yaml file for mt8188 platform.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


