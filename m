Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F4FC636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 07:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fdxhdYgUrieRTHDHYg/VxkIsWyyrT4Lc3Lq1NP/cZ4=; b=a3ADzpebpWpK/ytl0OKd/6JOHc
	K7dJaxH9hNmC7ZA+tAvcF48DBv5MqUxWYCrQkkavdPa/7XCNCwy+riIgdsRP89rJT7atSmDLl7c2P
	8VDknfBeasJ9A8/YdNfABUlPPo9plYmEv73ztsecK7aoMyNRa9zuQDhBfN4G19hmMSRaaJh92oevQ
	BaGX5diYW0jaRvNMfIcTjRvKCqqS4SR6rjUoXKIZjg7EI170SNYMR+U6a76TXsZisYpF6epg81oF7
	4WGJiv+2tVTX9PJMZG23RwqxMt//TUvd/peV7JaBsiV9YEXrjkuAL2eRsx5XHxbwTLYFX3PtZKpxQ
	ctbHwpow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSv94-00D58N-BE; Fri, 17 Feb 2023 07:27:02 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSv8l-00D4wp-Sw
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 07:26:45 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id bi17so2625181vkb.9
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 23:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8fdxhdYgUrieRTHDHYg/VxkIsWyyrT4Lc3Lq1NP/cZ4=;
        b=ZZ7ZJuigvVz5KfSje/MdYNtDmS91EC9g9+auzcOt2EDXKzg1pv92alpsJtnuGu7XPz
         ySePv3EhuySbjAcK/wxIz3IiWls+IFVZgB7HmJUcKW/dIeZbAiHpIW9qE0P5vt3/OVFH
         behyGp/qka25mpBkg7FLpJL2Qf05w8Jr8KxS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fdxhdYgUrieRTHDHYg/VxkIsWyyrT4Lc3Lq1NP/cZ4=;
        b=WjTzAC1ryiIZNBFATiPmIdckLezK3NdOMj+SJQjSR+Ye42T+fJ7C2VMufFNfeN17dl
         pS7wyK27Tb2r1kkdmDDRDM9MT3tHGhXrCw+0waZp3DtnZ2UKURB8FmAFjx3jUfdvMg7I
         VaNRWLV33qU2SmMn4un3zhCaIVnrb5LmexY0EVp5Pt0KHWZPGYpotJGxqN7ElfsqM2ua
         nEG5Lq02gsPaKIN9cVRJtuX6v6exy0nCmaT1tFOUhDRmzpVXUzInNDVWxBTx65NWtwq6
         fmm0BFdZIZLpChA0eJFd3vSHUCFofECYb9sF+rv3m5mFOLlTnosBqtneUgypv9QPiNGm
         pVgA==
X-Gm-Message-State: AO0yUKXrAPIN0pvsn9XqJI866xKHigll1dc9gGhwhGPF8+2S1BXm99c6
	d+KwkSECZTuBseCsaT3raKVmzkZX6YdbTtTxm/JmEQ==
X-Google-Smtp-Source: AK7set8jPjsh41skslVXvudRd5O1/mU3tyaEp+bhxmI9s0f0Gj25wehb+e9KPewhiMMtyVT6ouBXY2+DbtziPqkuqsY=
X-Received: by 2002:a1f:a447:0:b0:3e8:66ce:a639 with SMTP id
 n68-20020a1fa447000000b003e866cea639mr1392988vke.2.1676618800587; Thu, 16 Feb
 2023 23:26:40 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-44-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-44-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 15:26:29 +0800
Message-ID: <CAGXv+5EWRJNhw86-pAduob4Yjy83tdZPpBFbj-13Tg4=_Vkucg@mail.gmail.com>
Subject: Re: [PATCH v2 43/47] clk: mediatek: Allow building most MT6797 clock
 drivers as modules
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_232643_993358_9656BF96 
X-CRM114-Status: UNSURE (   7.16  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Most of the MT6797 clock drivers can be built as modules: change them
> to tristate to allow that.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

