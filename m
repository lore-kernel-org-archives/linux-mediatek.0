Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20749C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 03:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=stWcHpU1evptdwDrBo9i+tZNVNuuXRw/HaQZ8nKTLh0=; b=I+MO2Pc1czE2t7
	lIe2ZvOFnPds4O/5G53xMJdJ4w3VGis8hNtLFoD1aiqXpMUw0lkRqZYuNV0xDTF1yN5+NBci/bsXs
	OnEDbnErxojrh28wc/+B/FQi+1KyKPtEOuOjlL8/YPSDZSb50VG8ku9xIG2xJZluEA844gOwNFAqQ
	sVzvpf5FjcdopCX9WZTb8ywgcB1008sNQsmPSENmxiKMBUxcTq5nJg2Vbo+sUgu7idmBaZ8CdGx4o
	AOFNDbRDriOYXtQNUS9PVmiiD9VXkjoG1AU1+4lYfPawKwfvmnGejNAMH6MSzOfPitZ86HO2poV5Y
	V1A9YamWOoxnkiB7Bx0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHdFI-00G2Tp-B8; Wed, 09 Feb 2022 03:02:16 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHdFF-00G2TK-Bn; Wed, 09 Feb 2022 03:02:14 +0000
Received: by mail-oo1-f46.google.com with SMTP id
 189-20020a4a03c6000000b003179d7b30d8so1005157ooi.2; 
 Tue, 08 Feb 2022 19:02:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r9n/VE8ShNQNiwipYWkPFL8cBHsQZxENNYkTj1Nzpt8=;
 b=UNM1PGG0eckj+g1HnjvuoADJMZigK5RDsMuvNLC4CgiORJw3NCYQ3j2Su7fUeLJ7+i
 i49muHE0v8+bF/uZCURFntvJ9arpgSrXoiIfaKfVd19I09In00u4/K//7lcouoVeWHvJ
 1P0H20FuQ7vbu2fdXOD1Q4y//4UBYrok6ti0xbFUe3JGy7eMQAl8S+5O509Qz4efsxQ1
 tAbrER9QwrXR00dVThFuFAydUbnUtRs38Nq2orjnMQ43/wUwVoDGjfo1nZRdRKuzjJrA
 Z7lEWfzcE817xvHajZP7959XPi0DCo4E5Kcuau1KIbhlYHahs+AB92kLlRk9me9iIphH
 N5Jg==
X-Gm-Message-State: AOAM531bNq3wx6rJNKlm4mrpJQYpPBnkutJAixLbxekuInJrNPj+GD+i
 Dhct18Z/PZxPXwktdL8XUA==
X-Google-Smtp-Source: ABdhPJzet+Dv7YYDkSGgJ2JnIoD3tapZgHhdllycdoCmXgkx2+9s9J1YxBIMJuyIWUjbzLMqyE9qyQ==
X-Received: by 2002:a05:6870:91c6:: with SMTP id
 c6mr103120oaf.147.1644375732021; 
 Tue, 08 Feb 2022 19:02:12 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r186sm6264409oie.23.2022.02.08.19.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 19:02:11 -0800 (PST)
Received: (nullmailer pid 3539514 invoked by uid 1000);
 Wed, 09 Feb 2022 03:02:09 -0000
Date: Tue, 8 Feb 2022 21:02:09 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 George Sun <george.sun@mediatek.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel@vger.kernel.org, 
 Daniel Vetter <daniel@ffwll.ch>, linux-mediatek@lists.infradead.org, 
 Tomasz Figa <tfiga@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Alexandre Courbot <acourbot@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-media@vger.kernel.org, Irui Wang <irui.wang@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Steve Cho <stevecho@chromium.org>, 
 srv_heupstream@mediatek.com, Tzung-Bi Shih <tzungbi@chromium.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Fritz Koenig <frkoenig@chromium.org>
Subject: Re: [PATCH v1, 2/3] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8186
Message-ID: <YgMusfSSXXLlyxyX@robh.at.kernel.org>
References: <20220122075606.19373-1-yunfei.dong@mediatek.com>
 <20220122075606.19373-3-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122075606.19373-3-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_190213_429017_909A8390 
X-CRM114-Status: GOOD (  10.76  )
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

On Sat, 22 Jan 2022 15:56:05 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8186.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
