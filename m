Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3825C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jan 2022 01:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VERyop0vWaiNBFSrVyBQhkbafa3PmpW59QDWUACkHoY=; b=AFV1cCkbQ4VEYW
	4xdQZ9L7eCcZ8clAiUhPnjjp1fO+dI6jxcWBbhJSWnDZPYfp1eBe90SmFPbXDDbxKE8dHsnLWDPOp
	qLlMFSGXdremWhNPKDl0mCrkssIHG8AmDo5ku8c2L2h0r9Zco6vdngp7pE3mZIPEBr3JChmxL9KzE
	u5NT1anlpN8VgAbV/xDlWOFivtbcE88yR2+t9T4n2wMogkmOjDrs+mx+5ZBXcteVVhvyc+5H5hk5M
	7dbObpnJSEYBSC/Lv8DT8yqmaAzQKsksCPdoBsDzDKeSrc/7/IsLv5/XyRY21CCIB9R1yl+FLRl28
	3Kj8NXFMRjlPmpcNgGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDzFQ-005kfs-Qg; Sun, 30 Jan 2022 01:43:20 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDzFF-005kdX-5x
 for linux-mediatek@lists.infradead.org; Sun, 30 Jan 2022 01:43:10 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 23so29770264ybf.7
 for <linux-mediatek@lists.infradead.org>; Sat, 29 Jan 2022 17:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l4WivkdTm53Jw9l1J9ROUjCL84RYPC3TVleYiM5qsF8=;
 b=XUEW8qHU1uz45LsjpBiB2OtdsXRM3uS0slep4OE62Wgdo0fh87Jt7qZm078mNkVC06
 VbHLOljIs5JDsbc02chw8GA0e6bIciURxOFiajehMm2Q8oxEwNBtbzGrORyItKFWGI6H
 Ye1fL+MexX77wjLVdZ7lqUXnlCDt5SebBTes6Ins34GxE58D+p3qVYQu+tOLavM5VpQK
 rA7b/RipQFpGUC6/+Xqn6380ypXhHgPdO6NTvZErfpv0tstvxosanB61IbGwwBK0ZDTh
 nYvLLAFxuehucXzc48vgeBq7cr2+68i4yJNjLpdpChOCWFS3f0EqEDybWoxzc1cUPvdb
 Vtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l4WivkdTm53Jw9l1J9ROUjCL84RYPC3TVleYiM5qsF8=;
 b=4jn9QxkjRCuAXfHuN8Twgn3mvZL+/z4TGXLEzRwV7COS2VIvswTM5tmzEejaiLstVx
 AzzA7bLvLEaa5PgXQHrkhzqM8jXc+103AB3lwFLn2nmwjtlsjff3/iykwGPyvC+Atufn
 QZJ2XFHCiKflciCQtCsK67+cskUynIfIP/cJW0E0Zzn1Cy8X91nAuB2WE8eU0l8LUFVp
 sX6JSBhVXPXpBvhCtVw3p/m7S5mOpJweABFqEq2nVUIT4g9tdzSZH8g48RKHjptcEHkv
 fLBBv7MwB+Eyn8adt5VuOE2hzADpK6rhIi9rPqb+JDG57kgEbpHl4K61TcLgdSmY5rlr
 aR4Q==
X-Gm-Message-State: AOAM532hee2hyXDHFCtjnl89cVj/9J2nqMOmvYMXuD6hsZ5jbX116ubK
 UPYGszsyQbAbhHIkqkC14hSMnjQdbShCyPaBxorf3g==
X-Google-Smtp-Source: ABdhPJwr7mIRo9eScUWXPNLILmR+M08O5ZXFiaTInfMDPkK1vK9GuO1CV/W55bipWFRtdTE5YMsvnDS2LnCQ+FgAbec=
X-Received: by 2002:a05:6902:124a:: with SMTP id
 t10mr20339897ybu.634.1643506988111; 
 Sat, 29 Jan 2022 17:43:08 -0800 (PST)
MIME-Version: 1.0
References: <20220121060120.10683-1-guodong.liu@mediatek.com>
In-Reply-To: <20220121060120.10683-1-guodong.liu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Jan 2022 02:42:57 +0100
Message-ID: <CACRpkdaL_cUj2rbQUSzVj+ViEuNWiQbsakChNkaj6FK+fE76FA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: mediatek: Support pinctrl driver on mt8186
To: Guodong Liu <guodong.liu@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_174309_257362_31E57E89 
X-CRM114-Status: UNSURE (   8.97  )
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

On Fri, Jan 21, 2022 at 7:01 AM Guodong Liu <guodong.liu@mediatek.com> wrote:

> changes since v1:
> - add default pinctrl config to consistent with other MTK pinctrl drivers
>
> Patch 1 add pinctrl file and binding document.
>
> Patch 2 add pinctrl chip driver on mt8186.
>
> Guodong Liu (2):
>   dt-bindings: pinctrl: mt8186: add pinctrl file and binding document
>   pinctrl: add pinctrl driver on mt8186

Looks good to me, just wanna loop this by Chen-Yu Tsai for a check that
it looks good to him too.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
