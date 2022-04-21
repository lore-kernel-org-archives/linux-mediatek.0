Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38FCC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 16:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+3n6jQYrujdv6AASClf4n5sMr6jkpTTq7qk0ZCor9s=; b=VPflG40AN8nJxx
	9toLwU9b06wV0nOgblc185HayAJHKHNIDobqrHVpqHKE1Ba/tA3IW9c70oPfzgUu5vO4YW8xeKk2t
	VvUzGh8qnOSLMp5MfCgLKJx6J/cZ7uTVVTCr8KGgosjKkCHt3CrsnUxfYpFoHYSnkKsHf9vu/eDAe
	0Iew4mu+VC54Hfxfgimgij3cXIrmFkVVdegm45vGcI3B4+0XvAcBL35sx/r6pQMyZO3EIvtbGepK+
	s3Xp8Au80y1fcONmnrY2rUtrOogD5UhgHr/iyAKp/NWjo4Ud7o3xhvQHQ3xCDSuv9RjrLAak5JRFp
	hV74unI1kGqnFmxMcH/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhZYr-00ECoR-6D; Thu, 21 Apr 2022 16:21:41 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhZYh-00ECnK-0r
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 16:21:32 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so921873pjq.0
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Apr 2022 09:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zOgF5YHHdnw6KFfM7+TfvuQyjrbr/lX5m0szyjvIkws=;
 b=AZ6UWC536Tr+qN6iz60AuoVTHsNIJZh2fChIEo5NiY0GJ/2lpSLHpxlUwQYpLLnCGF
 46dnieAD8HD3maBt+IEPmJ3/MxXRfN3Vd/YfUa/cFDSklKEoQHNORUJBPNRaFA8d8gI2
 D+ezgg6ARlOYxeT5LjVHUOM42nantNwr9nDeWoE/KP2nxQTGfe678ToHMMf+7UMlSkU3
 qd+jXYER+2NHQVYvn77FyjkOs5Azdt6NBzzx/BTOBRywlHUwmSqtohoFc4jGPUZiCQoK
 T6R/cptVJXD96SN2vEcwhozxmRL20K7eZputX2D+qFZZhjuuIlWo8etvzEV+EIBDqWXN
 pV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zOgF5YHHdnw6KFfM7+TfvuQyjrbr/lX5m0szyjvIkws=;
 b=Yxvkv1fH83Vyp3n+JvODRApfPpBq1PVn6saD9qpCsYD9uhyaGdO1IdAf8QxL/QmJNz
 6ixbcLuQtH84l0DDQH44ChU5YAxQK+7XQVajI1BHkHVjFPr617x/M7lsDoC4WzbLBrah
 YEO70Ldv5nSlJWrI7SmtOh8kvBipmKTcDTThxQcyixYMyekNz3SGhcquUQ68GVqYwhbH
 1J1a5BH+CS5nYvKyx03/+ZcIYtTqz8MgO6qqcwseo5xcweJywWewxDkQOhGOiwtZV5xl
 TDk9WO0QZFA1j5D/+CLg2zfS3ersPuwO0OorH6zurdb3KulbsQ4CRQxWLnp8j7UOT7cS
 BqRw==
X-Gm-Message-State: AOAM531nL3DFmXUFEHx8894CnXRyC2qFj0SGjlTJdkbwjk1V8v5EGIY4
 kIXzkBzbmobeAGm3HmnF7lR0lg==
X-Google-Smtp-Source: ABdhPJyKW5sbH8IITrbG/4Ys8s+ipSdmANtpb03yMQnddgED1EkdIIGyeLpEf+JUcB5R0yVEhlgV0g==
X-Received: by 2002:a17:90a:9416:b0:1ca:c87b:9439 with SMTP id
 r22-20020a17090a941600b001cac87b9439mr455923pjo.71.1650558088025; 
 Thu, 21 Apr 2022 09:21:28 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a637f4a000000b00373a2760775sm23361771pgn.2.2022.04.21.09.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 09:21:26 -0700 (PDT)
Date: Thu, 21 Apr 2022 10:21:24 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 0/2] remoteproc: mediatek: allow different SCP
 firmware names
Message-ID: <20220421162124.GA1596562@p14s>
References: <20220419123331.14377-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220419123331.14377-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_092131_094742_534EF8CC 
X-CRM114-Status: GOOD (  15.09  )
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

On Tue, Apr 19, 2022 at 08:33:29PM +0800, Allen-KH Cheng wrote:
> The SCP needs firmware which differs between platforms and SoCs. Add a new
> property "firmware-name" to allow the DT to specify the platform/board specific
> path to this firmware file.
> 
> The firmware-name property is optional and the code falls back to the
> old filename if the property isn't present.
> 
> Base on remoteproc/linux.git, rproc-next (58b7c856519f)

I'm good with this patchset but I'll wait before applying to give Rob the time
to review it.

Thanks,
Mathieu

> 
> changes since v2:$
> - use rproc_of_parse_firmware instead of of_property_read_string
> changes since v1:
> - fix a misspelled word in commit title
> 
> Allen-KH Cheng (2):
>   dt-bindings: remoteproc: mediatek: add firmware-name property
>   remoteproc: mediatek: allow reading firmware-name from DT
> 
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 7 +++++++
>  drivers/remoteproc/mtk_scp.c                              | 6 +++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
