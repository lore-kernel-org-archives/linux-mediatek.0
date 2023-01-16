Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7664C677F1
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 14:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdmqEadwQhY8LwyQrmgrduPbKJM/C9dg+NjVdK/rjog=; b=hsVOnLyAjChIUlIpRAarFlTtjM
	HlIucswF8fbqjGhKrDnNFOmgbYsDnwEakivDdryKZ4Th55iV49pHmLaWti2JPW7m1p/cl5/LohYkK
	rPKznhEVHqzn9XnGaGfuxyt766i+OSQiYvG8IHJG2T1ZiEO4HH16hkToQVAvWiZCbhFcLs3XyDWwN
	Y9UuuPXy5u2VIBhda1No0xupGTgY3VOkuOoGhaGQm3Z/iaEpGOfess0KYU18sXaBSe4T8oxkgQfff
	XDJzWpcvAx4M34FWiFVYCc40C53G7buLCQthGK5VcSmwN8Nc46rqm62SEVrYspByom8Iz2bN7aH7B
	Gq553k1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQ5w-00AhdY-MA; Mon, 16 Jan 2023 14:04:16 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQ0L-00Aet8-VZ
	for linux-mediatek@lists.infradead.org; Mon, 16 Jan 2023 13:58:31 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-4a263c4ddbaso382086417b3.0
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Jan 2023 05:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdmqEadwQhY8LwyQrmgrduPbKJM/C9dg+NjVdK/rjog=;
        b=vEts0zG8SjXqPvmI9cPbfDWfaKSWC4FbMIfl4Nfg/pZa0T8rjuk6Ycg11/ZbqYj5KL
         9NQtS3/ydA9RMrryNwpWj7BXakqrXB3TuEZKNqVrrI2nBSEsX/jBbOTEuSwDa0AEQnOq
         IlryjgUvH0LgC3jYWW3DUUIbOJpL6Chalvi2moupXdMIG5eVIyFGx6LlhdMPo5pXxe5w
         1B261LdURZJcUEfEJH1vfYUIGBY77yp1k3RgiDBcuOLc/7xeCi16q3hsFg5gSdE7cvZT
         v2Tbrfb5eeY4PTswDG1ZiNSnelSJzGXTbQPq+l9aMYxn/WKybztwA4dCe7Kt56854HCb
         tJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdmqEadwQhY8LwyQrmgrduPbKJM/C9dg+NjVdK/rjog=;
        b=leuNW3dbVQ+Z5hGfeWFrUxc4/bqN5MsztwMOz+0fGGKFYejunNsvftHfasPfnUAXKL
         BtW4OE3roTVrK8IDmTz44bkkQP/JKEIqYNM/tSeZ85jmnStE+GPYDu/l3rTlLnevitXc
         YxV8kUXzUuYaYqLlsvPW96KZwMu9+OR6Qnqi77CVSQO1JBlpz1SLBwoa2SVdV0TEvXPu
         Z1b2XRBPe1lLNWYfAbWMU3XsmVk0JhVGzuanLAmrZsmsuddS+lbi7HCOoIoeJgDFyhg4
         NZNlYKbeUT3V4YgfR9I1DpsDl+9Yj9vYmHOh61+iiPvH0Xke87JrkgcnMg7f+BNz2fYl
         4A7A==
X-Gm-Message-State: AFqh2koac/a6pXYyv2wDOaCfst5F6tRMbPeQC++kETlXC4EQ1jBgyMVW
	lng8ZB+8bUw0vEw1VDcNsw4bzsbBMtQAvEnqnzvMtA==
X-Google-Smtp-Source: AMrXdXuk3lCDgyPv/iBFiIH6yYKI+djJAQTtOQW4/8iFeWmHZk5voPyiEzhF5qJCmRWK+x9otY3kSC2ahQBtp/im0r4=
X-Received: by 2002:a81:b80b:0:b0:4e1:a40a:af7a with SMTP id
 v11-20020a81b80b000000b004e1a40aaf7amr1198749ywe.273.1673877507904; Mon, 16
 Jan 2023 05:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20221231160849.40544-1-arinc.unal@arinc9.com>
In-Reply-To: <20221231160849.40544-1-arinc.unal@arinc9.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Jan 2023 14:58:16 +0100
Message-ID: <CACRpkdYK_cpeV86uSesyG_64u7OstaxMm+oCbUtz24PcGvPqRQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Enhance Ralink pinctrl documentation
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	erkin.bozoglu@xeront.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_055830_080343_4D5B739C 
X-CRM114-Status: GOOD (  10.61  )
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

On Sat, Dec 31, 2022 at 5:09 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:

> This series mainly enhances the Ralink pinctrl documentation, and make a
> small variable name change on the subdrivers.
>
> I've compile-tested all the subdrivers.
> I've tested the dt-binding changes with:
> make dt_binding_check DT_SCHEMA_FILES=3Dpinctrl/ralink
>
> v3:
> - Changes on v2 were put on the last patch. Fix that.

Applied this v3 patch set for v6.3, thanks for doing this
massive clean-up Ar=C4=B1n=C3=A7!

Yours,
Linus Walleij

