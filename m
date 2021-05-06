Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29E6C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 20:32:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 775E361107
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 20:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 775E361107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ztYsJRpB28e4BG03uzNIuP9uusm40uSKKgd3k9g0TWU=; b=e5mSnvEkfnC0YMbJo/0MwC6ZD
	bm6BIz7imaq2ndM3oZC4jNvt4PjpbbJCAWwXTTqxb2mmTYSOm8WcErcpRgzP12AWGbOjUigDD5zQP
	g2cM08Qlpp+7//oiWGZwh/c4t+0l/xx+ci2FnpaaJXDuS+oIplPzqPlh2hh30qU/C1arkAubLQD7q
	8KN5Th0sf4zAfjGmOf0tFdBGZ8nBb1FCrMdAQdbG91a/2gmCrn2tFAlhcG4Vn58Nf5GgFamZxqpl9
	X97TuysiHgG8Sm6T5el7wioHIgjB8jNdhB55qv47XAuZyO1SPhnNJLMLlXfGtdtGgnHPZPG8irlRj
	J8wrfheNw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lekev-005G6O-Pv; Thu, 06 May 2021 20:31:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lekeg-005G1S-Qt; Thu, 06 May 2021 20:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZUvqv8wXTvOxaH/qGGyIwECUCA5kcL3mhfS8xu2uPHk=; b=VpYqRm4IdJBZkLi3xsz/jybVoQ
 Mnm08elBYcSlg1riODl6GMiAD08P4EKxNoFtrL/hYONjix1pNuEKsnLGSmp9xSlWHAkVR3SbIB6NQ
 YIqUnnsbOsCOgt07rpfBLcQLA0JjSaNvd+Hj5OZB25nSE0GfxZL2jcjXiqbYKq9ks4KxrNCUV+1Xw
 6gGXvdvjycUsczaPPkPssRGbhzSHXkBA7F/yR2l14zltMWT2z4HHFSMImdgfuJqsY0huN7Wqh4bp+
 bjW9fboHBoC7NZ9ei3Hg+VfRMD/fHWLxcRRt1sH8ql1Bm+5NGdkOc+zMvnSCaqoogfvEI3rDeaQdp
 wkxm1lGQ==;
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lekee-006NEC-FB; Thu, 06 May 2021 20:31:29 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 c8-20020a9d78480000b0290289e9d1b7bcso6055823otm.4; 
 Thu, 06 May 2021 13:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZUvqv8wXTvOxaH/qGGyIwECUCA5kcL3mhfS8xu2uPHk=;
 b=gDD7CNf2NsOZ971Zvdsy8cQpKcCIbiBTB1rWC1hJYAyMRkzmegg3AibvuSfFeUttpx
 CwsiJpqwZvzKti3dfrHTyhz3RkqHtDG1Z2+zoneoB8o7yQooZdJGgrsKAZULLdXUkShJ
 +Hy5rVyPqtewf9M+6bx396Sd2KL3l61TrYXNpvbqNabQ+dpgD2ygF2LhLJC0y+effyfq
 JEIdwOcJpwiUozUxc7Tn3wX5huqRbcdOyX3HR7P8MIsTRdDJwweyitNcVxdNeEA4/6cP
 8E+PplLKvpsHZkuREPYfAgZnExEEbLu1hNCccqhwquWYuNb7Gw+9JIy7G1XJFknn5twB
 HSdQ==
X-Gm-Message-State: AOAM532Em6LIfTUqMi2yy+7hFNyOl/iaaXD88W3GiF3Lp7AZnleIrlkK
 4YBGyU43+tSdB6JJb8cpfg==
X-Google-Smtp-Source: ABdhPJz8lMGGpHHpxe8oPwoIyPVl8lU7WK/RGmlZ6n9ATJy0QvSseGQje+V/PuhA52UcWZiIbXhI8g==
X-Received: by 2002:a9d:6ad6:: with SMTP id m22mr5272913otq.146.1620333087184; 
 Thu, 06 May 2021 13:31:27 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i9sm771288otr.19.2021.05.06.13.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 13:31:25 -0700 (PDT)
Received: (nullmailer pid 753794 invoked by uid 1000);
 Thu, 06 May 2021 20:31:24 -0000
Date: Thu, 6 May 2021 15:31:24 -0500
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: mediatek: Add optional mediatek,
 gce-events property
Message-ID: <20210506203124.GA753747@robh.at.kernel.org>
References: <20210504054612.3585017-1-hsinyi@chromium.org>
 <20210504054612.3585017-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210504054612.3585017-2-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_133128_527888_EF78DDDD 
X-CRM114-Status: GOOD (  10.05  )
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

On Tue, 04 May 2021 13:46:12 +0800, Hsin-Yi Wang wrote:
> This property is used by gce clients.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v2->v3: move definition to Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> ---
>  .../devicetree/bindings/mailbox/mtk-gce.txt       | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
