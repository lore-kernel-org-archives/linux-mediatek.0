Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E529C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 05:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCE9gf8zPfu1gZPeQ5v4ULd4nbnx8fLi0idKbDu9DJo=; b=moPfJb/pyGsp4+
	CtK86JuDlsLS7rP0mqBwQuWfN3Z8oQtdVD6orErIVl0ZaJoIQCfGxJKj4ayLJ4IqM8pYi0fTbZdKF
	+nM3fces1H4nC49T1n+T1NlFPlEP9vpuW03E4nytFIUyfiE59fONS30vxpLDo9UAbi3ehIhEYX27E
	sVkYAKh+B4E9jGsLlB6RiX9RVVr5LbsXeQNDO8dveRNQSceGyOZrkB/Wc6V19RQgGGpaNjM15g0o/
	e5pz+aNqCRlby6K3Vlv0enqy4kND69BUCu3WeDEXalPxcHVFVUrJ/VgATxDCYf8boYs4rsowc8Ee8
	51IscqMaW3SmA+SWB+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Rx6-002JFc-Cl; Wed, 29 Dec 2021 05:56:44 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Rx3-002JE0-Jp
 for linux-mediatek@lists.infradead.org; Wed, 29 Dec 2021 05:56:42 +0000
Received: by mail-pg1-x533.google.com with SMTP id 8so17671695pgc.10
 for <linux-mediatek@lists.infradead.org>; Tue, 28 Dec 2021 21:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yw8/kl2LGfHC+BRmnmcCo9TSrmmH3aT+nAaekBOiO84=;
 b=Jz2/jPkRYhFOljG62i4B7CbqP2s+5rpiUExqAr3THdm7ApWZCW3quUvQUc6TCbjvXz
 ZS14n6yc5QX7S5//GZczK8jcqzKPY5Zyj+klFtCJZ1s/5NB/NociQFp/J76l+mH64w6j
 vnrH+eOPmptJxsrYRNqWFoE4Edo4GPZq0MjWE/VuxP0VhL/nseetd/yZlI6GiXECgGuY
 VNRFeWWXwryJXwVTH2juslXxwWQn+tPh92CK6Y6p1Rji40oy52SzTwEXxgITl+fvCkjm
 yDjpc50piI01C8nsF6lTsHaNgygcBX82iTuGLucZYsVz+AFNhcyUPnhKP67hEITG4wrG
 TiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yw8/kl2LGfHC+BRmnmcCo9TSrmmH3aT+nAaekBOiO84=;
 b=pkbreGoxd5Qr65Lql9qXy6XGyLbaew2f5yv609MijckX7GUBEzU/B/Nn2wCY5V1wJW
 4RQTiRMICm5lKgZ7V8HSxeOMRGOM2skhyg4daKVF9ontiWdwNCWSI4E6lSP7T4qh/BL/
 FsnXaBEcOUjVjbeTNMS6sHtVydeBbwcSF/5hvJxExWi62JyryGHOiLd9lch0UAdQgVUD
 hUWYDcHgZXFgxusv7ZGuL+kWqrxIR9ONVuWo/B0miNS5XB6MoA3IM15GbW9yp/R7QOPx
 CO6yTgtIFRUuzBMd22xZSxlYz1bAMNnhGBXvtgQpuIt4L9azYb1u29gXkO2H/sLKxbwF
 3Nag==
X-Gm-Message-State: AOAM532QERtbUXAKMcfdQzEo06dorvQdClHVKl8bRn7+iRG8LY7Mbtc3
 apH1LzaY+QUbrCoMC/PE6f2EBQ==
X-Google-Smtp-Source: ABdhPJzWVI7pbJHuImaGNh5XJMu92kFHsTAwgUYOuJm6wAZ5cXRl312R6S9VJqBw5q/POmfLp7/urg==
X-Received: by 2002:a63:ab08:: with SMTP id p8mr17578168pgf.617.1640757400456; 
 Tue, 28 Dec 2021 21:56:40 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4dea:2b20:ea89:724b])
 by smtp.gmail.com with ESMTPSA id cx5sm20766657pjb.22.2021.12.28.21.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 21:56:40 -0800 (PST)
Date: Wed, 29 Dec 2021 13:56:35 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2, 04/12] media: mtk-vcodec: Read max resolution from
 dec_capability
Message-ID: <Ycv4k+xHupjrualp@google.com>
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
 <20211228094146.20505-5-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211228094146.20505-5-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_215641_679185_AA51D905 
X-CRM114-Status: GOOD (  10.95  )
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

On Tue, Dec 28, 2021 at 05:41:38PM +0800, Yunfei Dong wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>

Just realized this on reviewing the 4th patch of the series.  Please fix it to prevent from showing the line in next version series.

> Supported max resolution for different platforms are not the same: 2K
> or 4K, getting it according to dec_capability.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
