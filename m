Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F2ECCD1BC
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Oct 2025 14:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pf/H8hwwjXHOcfEd9IHK/0BwkuvQECWP59//+xIoOuY=; b=JAnOaBPnePqodUUYXDHGVdVf1a
	+47+zaqIzPVhP5eEdTy6SKdGwNvtec44e6ArxHuckOCxuhcp+PrC99oNXhWdBe3aQ2IscoC86ZY+2
	X5jyzgHzw60cVrzPWPxkjYa+6mhC8QJHJeykziUnU0GhXxpOc1XPruIEJMAyBvOXtuVbRS01FZtbk
	qpG7PA7hyN3mnXhmneM83yJ1OEzkRx/q4fEZW6f94fC8n5Ey4PxjlMAhuosRHVFS1UAJks5Li/uko
	kzeKfK3tIJpcQZdgLFW16f/A5KDrrGZeg2mxFJka2X+bsNrFC01MHbagHx8zazZ/WDbc0K1O51DQK
	r1WXEKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwFU-00000006aBk-3GNW;
	Thu, 23 Oct 2025 14:25:04 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwFR-00000006aBG-3o69
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Oct 2025 14:25:03 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-33ba5d8f3bfso767732a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Oct 2025 07:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761229501; x=1761834301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pf/H8hwwjXHOcfEd9IHK/0BwkuvQECWP59//+xIoOuY=;
        b=jr4Dt0ZkkDjOYze9zATZI54O0aHYSbfXQSEeVPM8cgNtHCt71w2A8hlDBJ7bGlEL1y
         okfFxpNx2CQMe4cQhAgcOjpWFRZNbKlx1Edts99qWi3hEBekYTVeEBDgf/OaNEqPysyQ
         2ZKS8Ow0uglqtBpFzPav6SB7LcGbtS/gLJqO6gV6XTbg8ZolNfzK3PzBfXaDy+1NsaDJ
         63oaIH4y7qY3jP0FpO2AyPx+GGuyZ4pGi2nf1hkFtgEXSGwWLjFdCAHIIm+KF6FF4Q5w
         hsb/zef739n8m2jd50DxNKKi86ZhhLH/SJVFnLzPNbZ7taFYWVXnSTdvll4udOyooUFT
         RzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761229501; x=1761834301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pf/H8hwwjXHOcfEd9IHK/0BwkuvQECWP59//+xIoOuY=;
        b=lq5mVoxoBFDXobzfcy1dNhDhfGhz3LnkRpe0OE00gk7EsDRXSuhpt03e/y2s/g9mzJ
         L0p+GVmK/U5KFe3cS/6lCU8D6d4NNfh74EguOun8FxXiG2ypHwIRMjKTWFdXSxCLWuBt
         18yaMQ88gXKNBeWinCXV1Nt6yDbGbyKRgPjIfQEBBnb26YxRJbjlNmV8/lrKV5oHwEli
         FksWPzJO+NZ6rj01pDiIitfdElo8W7m7rwwsGehCM5oOPut0Ya+qP0nK2Omq5Rtk0Sak
         0oAF/d4ywCljxGrUO4k9LSA78VBiFe/ZN/wTbYEUVn7+VCbPbanG2IyOrZ4BC1rk7bH8
         O3fg==
X-Forwarded-Encrypted: i=1; AJvYcCXS8ff3E2J+bFtAQucdZ5rj8Dj5BSONIcO8d2UgaOQ/Es8vFuYt+7fmTeUhdE8XUmSFbyamsEj3CTBmnTNutA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxovq+RJTAP+OtNNpzaUSQ6H0MPt4vL18gZDhle55Aj0tGp5QTL
	ZQghCxAfGTo7YU2VxI+8JFZ35uHRUQZqLG+1yNPaM4kdsrpW6cl8UGQJ
X-Gm-Gg: ASbGncs03GaYLg7ATeeocepUFFKCjYp/HNSbmQChyehVjA082cnKttiqBpf78wvUedA
	TLFSu7hhRSpvnDiZ7MnHyCN+o+1RdcZykipW+SwSOnSuGHczxV4QMhbyLhTF9gCfZxvesANFE4/
	W57hVUsFOz/iBzkXUXDMj4T7P5LVwcep3JCEgDjZ8/Bs4i+VME8OvuuSmMMA1DiTuIeAbBChxYs
	VKXeMBI6GyKf9bZmhu5OndwsfEImQ7SkQRGskqDgVg+J6By/NG78vk1SjLr0gkRMck00ndMnxfR
	F2ttekxT7ELyW6xBI/cHDMR8qpu+nS4zmWAAs+TADFv2Scqoh/kr/+kq/se5BQV5pAl4/3ayasM
	JQb2gun/4CD2r9IyOmUXRPY51WqrDrHqnh4io+iG8LQ0ilCGCn4uVUSnbaDyQcVdNk7E9bYp4iL
	E1r32+doXMQfjT5mrwPg==
X-Google-Smtp-Source: AGHT+IGe4BeM9/pmyB243lXYseQKK0oQC2Kow3UQh2Om045EVbmJQKLCQhmwXMTvnHHyQoLOWJ+UeA==
X-Received: by 2002:a17:90b:2d8b:b0:32e:d282:3672 with SMTP id 98e67ed59e1d1-33bcf8e4a07mr30935358a91.23.1761229500703;
        Thu, 23 Oct 2025 07:25:00 -0700 (PDT)
Received: from rakuram-MSI.. ([2409:40f4:2040:16ed:f15f:ed0a:f0b7:34d2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb0191b1dsm2585682a91.18.2025.10.23.07.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:25:00 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: lorenzo@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	dan.carpenter@linaro.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lkp@intel.com,
	matthias.bgg@gmail.com,
	nbd@nbd.name,
	rakuram.e96@gmail.com,
	rex.lu@mediatek.com,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	shayne.chen@mediatek.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] wifi: mt76: mt7996: remove redundant NULL check in mt7996_msdu_page_get_from_cache()
Date: Thu, 23 Oct 2025 19:54:47 +0530
Message-ID: <20251023142449.117936-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: aPoqiioo6kUZ0kbY@lore-desk
References: <aPoqiioo6kUZ0kbY@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_072501_985950_174CCE50 
X-CRM114-Status: GOOD (  14.49  )
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

On Thu, 23 Oct 2025 at 18:45, Lorenzo Bianconi <lorenzo@kernel.org> wrote:
>
> > Smatch reported a warning that the NULL check on `p` in
> > `mt7996_msdu_page_get_from_cache()` is redundant:
> >
> >   drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1651
> >   mt7996_msdu_page_get_from_cache() warn: can 'p' even be NULL?
> >
> > The function first checks `list_empty(&dev->wed_rro.page_cache)` before
> > calling `list_first_entry()`. When the list is not empty,
> > `list_first_entry()` always returns a valid pointer and can never be NULL.
> >
> > Hence, the `if (p)` condition is unnecessary. Removing it cleans up the
> > code.
>
> Hi Rakuram,
>
> this issue has been already fixed here:
> https://patchwork.kernel.org/project/linux-wireless/patch/20251014-mt7996_msdu_page_get_from_cache-remove-null-ptr-check-v1-1-fbeb7881e192@kernel.org/
>
> Regards,
> Lorenzo
>

Hello Lorenzo,

Thank you for the information. I did check both linus-mainline and linux-next
branches before sending the patch. 

From next time, I’ll make sure to also check the subsystem-specific branches as well.

Thanks again for pointing it out.

Best regards,
Rakuram

