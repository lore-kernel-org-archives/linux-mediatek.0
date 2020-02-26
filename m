Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93436C4BA0A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 03:42:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 661E52067C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 03:42:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A8jNvu8T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kJDoUvS6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 661E52067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZvUg58ALEVAJgx+ILC40Rr120uEPk5aRTi534sOoXM=; b=A8jNvu8Ta8NM3S
	8xtsVg6r20G1C3wNJIFqw1FCVB1x5rLjHdbjfCUDOhE86fzAB+k4QJnBAJx3ifHnu8h9b0nKf/VOZ
	mbC8ucXqE6aXOTYDkUi8ejliSBurIvP1kY0pPNKQv5vEYmpO6CysIX4B67m/kv9kFv7yg8kTD1OI9
	HzSHLpIbHrIeJ2zOhbXQ55YXL3SXpcHA6gk3wInG1Iya20+fV6dwEdlnxxBUWL8O44jxaMnYm/TNq
	cHOeMy2z105ni0zyy9F0HBkSY5RbYotlBdTS9tPq4I8JzvetKUPxPF8XUp0lbw3aMCPmC/EuS+ulL
	HP7obNYwc88aNptEh5ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6naa-0007CU-Bp; Wed, 26 Feb 2020 03:42:24 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6naP-00072n-52
 for linux-mediatek@lists.infradead.org; Wed, 26 Feb 2020 03:42:14 +0000
Received: by mail-oi1-x243.google.com with SMTP id 18so1623863oij.6
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2020 19:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zhbMFZH9TV9xXX3bi0AiULw9sla8JatRwgZ0NfA605c=;
 b=kJDoUvS6OOJk+ypY1EujEwgsPIKGLXE6pkmbSfiESFefGeQ4Nl1/uklyaEW0ZctjRf
 /BuGku1pbGbTJQkAKdFDT07ofldpcOno6F37PivyZNi0+RxqwzT/xWZ+7mdmIjlguqAH
 zHSYv7AFcb+vycN05DI991TYsea4JG/1ynAGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zhbMFZH9TV9xXX3bi0AiULw9sla8JatRwgZ0NfA605c=;
 b=Vp7aodejMpK9aAKPtoB6nXsQUN8lQ8Y71U99OI9nvZJS6JecdU1QsyPPc3s0+7uS9r
 qA0g47Yfx8RTQan7BHHdtbb+VJfsu1tnd66UiUz8YOykfXQ4DPXX1OLfU8wW4qzgG8cS
 i1YLn7UzPMkK5HVsL9LEkck4e7crZHhvD959CbkoftF2rRPypeGeHoI9Pv4eha1CgrL5
 hrc+jU2GlOfYz4d9rzRvQNHpaKh4zALww5R+B3tvt+D7XURDO9I4jcmWGXfamyXdmDKO
 3giq061xvoGhW0ifpFmRkre56TOKuUO7u6EPKIbfYTRUOoie7WxmtlQv/5RehppBwUFA
 Idzg==
X-Gm-Message-State: APjAAAU3SXnCcrMVJdnFMWqRtcWiqHEN5Q1THVNOZhzyR5gT0aS79GYw
 0HFHnrjxU2RKlyPgMjKaGTS/OLsicok=
X-Google-Smtp-Source: APXvYqxjQ6BX8ao8WY/O0p9T1mb6lxIeWfkP10n6i7yz5sdwSphPLkglVF+mrSFekNQ9aeADqm22BQ==
X-Received: by 2002:a05:6808:4c7:: with SMTP id
 a7mr1597455oie.83.1582688531292; 
 Tue, 25 Feb 2020 19:42:11 -0800 (PST)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com.
 [209.85.167.182])
 by smtp.gmail.com with ESMTPSA id l207sm308423oih.25.2020.02.25.19.42.10
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 19:42:10 -0800 (PST)
Received: by mail-oi1-f182.google.com with SMTP id j132so1610571oih.9
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2020 19:42:10 -0800 (PST)
X-Received: by 2002:aca:ab53:: with SMTP id u80mr1537577oie.94.1582688529944; 
 Tue, 25 Feb 2020 19:42:09 -0800 (PST)
MIME-Version: 1.0
References: <20200226033646.20949-1-gtk_ruiwang@mediatek.com>
 <20200226033646.20949-2-gtk_ruiwang@mediatek.com>
In-Reply-To: <20200226033646.20949-2-gtk_ruiwang@mediatek.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 26 Feb 2020 12:41:58 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWN6bXfYvpBJ6XyPCuvJSpdxNOf4Z9RbY0jbnB5=JX_sQ@mail.gmail.com>
Message-ID: <CAPBb6MWN6bXfYvpBJ6XyPCuvJSpdxNOf4Z9RbY0jbnB5=JX_sQ@mail.gmail.com>
Subject: Re: [PATCH] mediatek: move MT8173 VPU FW to subfolder
To: gtk_ruiwang <gtk_ruiwang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_194213_219628_8DD3139C 
X-CRM114-Status: GOOD (  11.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>, srv_heupstream@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-firmware@kernel.org, Tomasz Figa <tfiga@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 PoChun.Lin@mediatek.com, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 26, 2020 at 12:38 PM <gtk_ruiwang@mediatek.com> wrote:
>
> From: gtk_ruiwang <gtk_ruiwang@mediatek.com>
>
> Currently vpu_d.bin and vpu_p.bin are at the root of
> linux-firmware git tree, it's not appropriate so we move
> them to subfolder mediatek/mt8173
>
> Release Version: 1.1.4
>
> Signed-off-by: Rui Wang <gtk_ruiwang@mediatek.com>
> ---
>  vpu_d.bin => mediatek/mt8173/vpu_d.bin | Bin
>  vpu_p.bin => mediatek/mt8173/vpu_p.bin | Bin
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename vpu_d.bin => mediatek/mt8173/vpu_d.bin (100%)
>  rename vpu_p.bin => mediatek/mt8173/vpu_p.bin (100%)

This is nice as it removes some stuff from the root, but for
compatibility with older kernels that don't know about the new path
shouldn't we at least temporarily create a symbolic link between the
old location and the new one?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
