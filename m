Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64097C61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDHJK7PCQBx6L0iZv4CPd9HBFqqmGXlBJv6+kgrFacU=; b=qDYQJQ8XXlowvKrgNWg4IpuDJC
	3uRqKxw9hu/77YRoIIOc7GKwxSkarAWfl91wyKIK+Ji70JYdPVs7+H2+OsEFQYSPYlgJFrbIPg+Vl
	FUma2+DZWxbAA5Fy4pDP+OB/rChph3loq9lzQAbKvNnWWlpJEFLNoJPeuhGZriAa2XEIZiIbP+ydm
	eQNDls2tC9hSnEZSwxbB3dmGTlvJFcJgWucSrvYY/hLF2RJJvSsgI3huncqGZgwmDxwCEY1VcfXXM
	fafze8862GbSZhgqpb3CrqTn2QwGkpEdT3rlegfZNKyROISzJi9bEHAqZkDav7rLhPfqZOsJpCzKP
	uG2JQWOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUqF-001nih-Q6; Fri, 24 Feb 2023 09:58:15 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUq8-001nVv-0c
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:58:09 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id d7so14993126vsj.2
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EDHJK7PCQBx6L0iZv4CPd9HBFqqmGXlBJv6+kgrFacU=;
        b=oL19UenMCpOV6pa0xyeo6Y7yZge9bBDslkKDkzJo5E1gesVFErH0K6sXV82MZq0bqG
         aIceBOKnJjTAzG8mpqvDoAp0VtPt6eEKqYYCKR2Al8VsFLhuNJGDajyihntPJocNB2DX
         ObGsoi/XbXx5b/ji4LU29lQvfduveVXsIQLTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDHJK7PCQBx6L0iZv4CPd9HBFqqmGXlBJv6+kgrFacU=;
        b=XdnuLy0hFVpn/yc+G1vGy3voU4oWug2vz7DUnnoeVhrc6n6MrEjSWz8IIi0XtKTWRi
         D8q5r/sebmr+9bqxsXqJcf1KXzZWIyaQ97qu0U4z8GRawfLW7vW3Vin+FLKpVPwPQhKA
         7UTefY21vGL/fegSDNVj+gMjhFksCGHDAabiI/wakjgFVWBW0hsXxZ+mVM50sB6cAacq
         8c2Rh/HfVoRqwdVGvijfrjBr/obTXofMiVHgJuw2q56I9s1754p+nr7ac6yZ5tM9KT8L
         Ck4jg1QdCApDv8Zm+JAluAzcQidYDSxOAqfrqNnQGYHqnnarg2zNuSqJ+FfbpdJvBH/+
         fZpg==
X-Gm-Message-State: AO0yUKWLbFjfRV1aUTjWTjP7eRfDDOp4TZYta8DugGjIvuq4pI/FoLXl
	MzBgfNKLJMjRYXxBzByy7JDZZEf/lm7toowgygqa4m0/S2d1e8sm
X-Google-Smtp-Source: AK7set8ySk174IvOPAfFf/U/t0BY8s+z1UpjOQThmLdmHOI8zTcs7XG1QV01MtzQ7FuxKIyGDqYBqfAiPp9X2FyzL7Q=
X-Received: by 2002:ab0:5550:0:b0:68a:a9d:13f5 with SMTP id
 u16-20020ab05550000000b0068a0a9d13f5mr4693072uaa.1.1677232687691; Fri, 24 Feb
 2023 01:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com> <20230223134345.82625-11-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-11-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:57:56 +0800
Message-ID: <CAGXv+5HQfpdA3qART761WqRQ_nb_8fFtj8uEY=_WtpbxWc8TZA@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] arm64: dts: mediatek: mt8192-asurada: Assign
 sram supply to MFG1 pd
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_015808_081226_48DACE15 
X-CRM114-Status: UNSURE (   8.16  )
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

On Thu, Feb 23, 2023 at 9:44 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a phandle to the MT8192_POWER_DOMAIN_MFG1 power domain and
> assign the GPU VSRAM supply to this in mt8192-asurada: this allows to
> keep the sram powered up while the GPU is used.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

