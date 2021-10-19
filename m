Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 049ADC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 06:48:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C522161212
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 06:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C522161212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYxfUMaa8cyvm5mpdom1nvRpFoVP0HL426OVFBSDEeM=; b=mmrInykE7Tmxbr
	JIcqfjPGVOpTzYQ00WlajrXGRWZkU4/O7g8TrE7VG5JxwV5kjiL3ccZdBGI8i0CHv6+eUHrq4amTl
	33Qi1JPv9O3qkCAvugrCiPZQMoINeVG/7J6g9NAAtavxUTOG4b3ywUJMf+yd5da/9BR/3JWtCN2CJ
	7rpxwHVnFMgcvJCzDXKPSnr2gfq6hanePnNxogVB/+fxBy2VE8jK1rPw0aBSnLLdcXGeQ/zZvnRVe
	hZNDnSXc3sAKeBXUzfDQNpdATQiBy+TDUhoKSxv6QyxtN78IXIIg5RLW4vilZxjt2s3X2+7epDgtH
	MjW2lOkrQldzSyZiwMqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mciuk-000Kly-Jq; Tue, 19 Oct 2021 06:47:58 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mciuW-000Kfd-Oy
 for linux-mediatek@lists.infradead.org; Tue, 19 Oct 2021 06:47:46 +0000
Received: by mail-lf1-x130.google.com with SMTP id j21so5322739lfe.0
 for <linux-mediatek@lists.infradead.org>; Mon, 18 Oct 2021 23:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rIzFACJIOpTQkxZxEQoVxUHikCOaXX5FiqyLZ4CJEJI=;
 b=D533wtAg6MrSlzGb2m0tVWHI61UjUFYeOl1HPbpj5hqt3RLRUDWWVtApHy4D2J+aP1
 ONelR9FGEn/13NL+fiJ81oINAfFU+CApUep3dA+zOEupFG/7rtNmr/hhqV3eEoYVtY4l
 8wrGa2U67U/szUjNrL1ozs8VcSahMon2mGPio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rIzFACJIOpTQkxZxEQoVxUHikCOaXX5FiqyLZ4CJEJI=;
 b=T4nydEqFbwvZ1Dx4JjOBRF+/OK0TaTOsdMQh1AS2I0kyPgVSX9d7BdlA0kqfCvhc7L
 22y/IdaCPsZnsY2LVufrYtUbW2Uo5xGM8FanQxEeFJskbHqR9v5JJkLXizZQdwbfpZzS
 eU0dG9EV+Avk5BmzVded/yROMaK9OGqM+MXDW4nz/nfQm4sxV2ZLR5yUPkZuFShKCEmr
 rB2061cC4rdrqB9+Y1eA4xmt/U957XUVEhbZM9bg1kGATmudk3iPRDSZBBKRUJKlSNZj
 5uf9u7yjX1gcfygWMSuLtR6GFSjX3E91K0kk09Oyi+0v6m/NJ6F6pcdqzYCVOZZROUrh
 ufag==
X-Gm-Message-State: AOAM531j2jME2mh+dVJYgyx6FqIgGAullPxz4dP356UjjU9sDUb53BNz
 1cPBoEBXHzAsn73zueaUIm6J5Op0rezElgg3vCSLdA==
X-Google-Smtp-Source: ABdhPJycbpCqB76HftgbC5KmrjMQOESzRPPGqSgE0BVuqBTQdyZiIcpoDSVMLlxtC7lx8QtzCJJIrO4vxxahverRcLE=
X-Received: by 2002:ac2:4e07:: with SMTP id e7mr4491623lfr.308.1634626061968; 
 Mon, 18 Oct 2021 23:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211019062939.979660-1-ran.jianping@zte.com.cn>
In-Reply-To: <20211019062939.979660-1-ran.jianping@zte.com.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Oct 2021 14:47:31 +0800
Message-ID: <CAGXv+5Ex-R-LQZJhT_nDwntPjCE72OKS3YNSp+no_0xYkFbDEg@mail.gmail.com>
Subject: Re: [PATCH v2 clk:mediatek] clk:mediatek: remove duplicate include in
 clk-mt8195-imp_iic_wrap.c
To: cgel.zte@gmail.com
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 ran.jianping@zte.com.cn, linux-clk <linux-clk@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Zeal Robot <zealci@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_234744_848511_62D69E68 
X-CRM114-Status: UNSURE (   9.67  )
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

On Tue, Oct 19, 2021 at 2:29 PM <cgel.zte@gmail.com> wrote:
>
> From: Ran Jianping <ran.jianping@zte.com.cn>
>
> 'dt-bindings/clock/mt8195-clk.h' included in
> '/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c' is duplicated.It is
> also included on the 13 line.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Ran Jianping <ran.jianping@zte.com.cn>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
