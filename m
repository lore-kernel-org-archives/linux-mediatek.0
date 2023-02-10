Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F02EC61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 02:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jo90fT9adw4ITfAMKjbT+YaT323PiF40asmocQVPwZs=; b=tSbjAp+LmzZ+2gZIOUV3Hr1JaN
	eM/Qfd+5F5yRigqxqyaxXxcYZwUNAUCxDVDD770Uc5iFEv7Lxibx01tmfDYFlKAChrit6HsSihCJR
	Ox13Ubttql+xUEd685fQBY0CVo/1jBWXzH6mZzOLYt/ycMEkMLjsaG/7KghHlcY6IHtuebNj2iJuj
	Ge+K/56RWiiXcDeyyRn0p2tkgvelWUgXPsvJqA4lWQbN+NirHRzvzpynLbTMoHBzByCzbfmTRkbKJ
	ftP0e6B5aeRsOdtYbVJ1U/kEZkxZuA8CEdgKb1vvOs9l/qj6NOjzGYX5mRn9SoezxJcHe5j4mbfjq
	hKaXk95Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQJN6-003xwC-7o; Fri, 10 Feb 2023 02:42:44 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQJMv-003xsJ-HL
	for linux-mediatek@lists.infradead.org; Fri, 10 Feb 2023 02:42:35 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id k4so4269305vsc.4
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 18:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jo90fT9adw4ITfAMKjbT+YaT323PiF40asmocQVPwZs=;
        b=CbFq9vhgLS1sRE+/bqsyALNQx2TMg+62Skowqei1rCDgiyfy8DRSr/pCnN4LTzHL0O
         l9ckKikPmnO1x+q0mbrcN8GQz3h2dALUhz27Y8xaz87EwdyGgmOlV/m+KDvwm3u8LdsT
         3WuGpSS2ALR90HVx0lEQTmDG3Ws3WtzR7qvvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jo90fT9adw4ITfAMKjbT+YaT323PiF40asmocQVPwZs=;
        b=y6Qvm0fDSsqeo9Xx+15a1mSV2L8/9n9LWcuGEwyWqNzLMY/QhZp2aTn/ugyJcVJcYe
         0SAhCzaf0WdsigJ3KqozDn7s2WnI8w2kaBfyJQu/BuhLRs7FAlgb8zaSicRoHtbaArZc
         BJXH7VEYQHIlQWmWjm3PN0t1v7j+Xkq6fh/PFSj+5M2xx+Tl45R4z1pTiRbX9tqY1gpk
         DKCl4nDEc0LJixDyexHySgMUvXNsmssV0v99Q1ATb45WRTjDZmb3HUHrR6FjiaIJWXrw
         K8qazcXb+sftz1JfBB36nFHwh16iCrFV+rpJc5PfdXP9UJ8RJ1ne34AEaZokfZE5PAJO
         yxjA==
X-Gm-Message-State: AO0yUKWjP/lcEFneBIW6COSIKu8jsjotNvhTAqM65gdpdUQPSOceGF+a
	u+usPbNApnE5omHJI4g3OBXWMdUhUEUe+sjQAVEnzhhBEkjDbnzQ
X-Google-Smtp-Source: AK7set8Q7Lk8HSrYlSHpANJRpQOSKPsQkJY82+BNpWbh3s+xkeDmu/ISTNHWmy67hfWHfHrGfG2EUe8RJ9JbcZwPGx0=
X-Received: by 2002:a05:6102:3d18:b0:3f7:93c4:9e56 with SMTP id
 i24-20020a0561023d1800b003f793c49e56mr3689418vsv.85.1675996950383; Thu, 09
 Feb 2023 18:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20230209160357.19307-1-matthias.bgg@kernel.org> <20230209160357.19307-2-matthias.bgg@kernel.org>
In-Reply-To: <20230209160357.19307-2-matthias.bgg@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 10 Feb 2023 10:42:19 +0800
Message-ID: <CAGXv+5Ek5E4XYyv9iM35o4sNRbfqVZMw6PqmeZHxzTps-SAq2A@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] arm64: dts: mt8167: Align mmsys node name with dtschema
To: matthias.bgg@kernel.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_184233_596621_D9A3B6B2 
X-CRM114-Status: UNSURE (   6.97  )
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

On Fri, Feb 10, 2023 at 12:04 AM <matthias.bgg@kernel.org> wrote:
>
> From: Matthias Brugger <matthias.bgg@gmail.com>
>
> The node name should be generic and mmsys expcets 'syscon'
>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

