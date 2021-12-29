Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4087CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 05:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLw1NbU3483bfExulijhMAd5d/1Nq7ZFydGYBrI0KJk=; b=QLIJOGTZ25dIjt
	s9ktI9KgEZe0MJVZIt6Yc7iaFbCoPuVJdVfHMpyZJBbfZ8R5Yj8KVGzWbLW6AerAhQKm0Ic0GPH6P
	CPLbs+R0PZaU8Qs0K3PDsA+hB27Ygditrn8vIc1I5oFKH8WYO6Pk7lhMt+NbC1F54tOzSrqEx15kv
	ZVqkSHYwsUk9UG7TSaR1nasTsX8m1yOcoFwniii7ra/3tth/7ij5eqSY2cQGoyU54lF+fn4pGvEdB
	7nm2Hvb7KiqXmKrJSrI1yY9iBoMsKjsLdltfmCtoxZUAS2oIoc/DEwbQNo94yCl3ZDRzclyZGQeBN
	fhxs+BJquiBEjg5fRiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Rd9-002HHX-2G; Wed, 29 Dec 2021 05:36:07 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Rd6-002HGY-0J
 for linux-mediatek@lists.infradead.org; Wed, 29 Dec 2021 05:36:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id w24so15092355ply.12
 for <linux-mediatek@lists.infradead.org>; Tue, 28 Dec 2021 21:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LCWTLU499vgUIibOB7RC/Lf29OvyjLAfzziGpa9pprc=;
 b=UHG2Wr/bUh9+RG3z6/wLDKvolZg27kHxzETT+w1PyYUO0M/sEDfnfDaXFK1/Fe+EgQ
 EPmePdb9FtgIXRoeOSmBlqYRDCHjdVhn5U3zfC73wvgE9tX1KbrJH1jfp4d9PlDGU/XQ
 WN/0TGLd8cDAoQlePh8eUjttGzfucKl1hZPjfzGSC0zx4iosSx7jERUbeqLcHxD1Cxfo
 lcoILVOjDWFPER13QQjV2dxLhxvnSaNP2wnyqahYu84szMUf1fvfvQZr6YYtlaI5wHbk
 RCareXx3mv9jLuqA1CDDe+stKGjbppVraM/vQFxLpzLq2BY9y8oEUIp+Z/T5s5sQNUgp
 GWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LCWTLU499vgUIibOB7RC/Lf29OvyjLAfzziGpa9pprc=;
 b=7NFR9jFuTKc7SWF5lq7uEG58XgUhtI5snk64iYooY8LY2Vfmq2FTCa5pwdarqojGKk
 2crlZAVf5F9g+XflcyjssnfbpHBkh35oKzYEFhg7k6OZwERuIAzevXIIZR+sMZ406W1d
 nm2kBR7Q7/Fgydpil073jRf40tvZfFl9xv1HXkte/mrdIaWsjA8Ny/4Fk1xALBwaM0eU
 vB3YMLARlw9R0E8kLSThoAKky/NXiM7Jl0K5aQoLZXmDGhQ5LluyhcfRaoi5y530eLWq
 TbAet7XKMG1Mvm26MN/R/9Lgx+jWukt5/NVUbr8EG9Hq0o6lrd+DcZqCP3twSUN9xFz5
 a41g==
X-Gm-Message-State: AOAM530eA1bkkaY/g6jGxLXgOFvF49ufH8CtP9hJMjIDbD8+lHd2pFj2
 LSQLXA8sPMXwodd5OJTL5EPmSQ==
X-Google-Smtp-Source: ABdhPJwI3ybkjKJD6RZt2826LHFESA/M3BbWEhFyh7OncX6wgaoW14cNyMMqRzWh+NFFFl1UtWzOSA==
X-Received: by 2002:a17:902:6b02:b0:149:7c20:c15b with SMTP id
 o2-20020a1709026b0200b001497c20c15bmr13898631plk.173.1640756162651; 
 Tue, 28 Dec 2021 21:36:02 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4dea:2b20:ea89:724b])
 by smtp.gmail.com with ESMTPSA id w7sm23509460pfu.180.2021.12.28.21.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 21:36:02 -0800 (PST)
Date: Wed, 29 Dec 2021 13:35:57 +0800
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
Subject: Re: [PATCH v2, 01/12] media: mtk-vcodec: Add vdec enable/disable
 hardware helpers
Message-ID: <YcvzvXQ2Yov3OSvZ@google.com>
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
 <20211228094146.20505-2-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211228094146.20505-2-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_213604_098300_61CD786C 
X-CRM114-Status: UNSURE (   8.37  )
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

On Tue, Dec 28, 2021 at 05:41:35PM +0800, Yunfei Dong wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
> 
> Lock, power and clock are highly coupled operations. Adds vdec
> enable/disable hardware helpers and uses them.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
