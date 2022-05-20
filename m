Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FC8C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 04:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m4HxhoRu2TTyASgLC/IY5L38vigR0qGRptXPUtPjqzQ=; b=KYlACs/TA48gNy
	9YBDcm8t3EHt7HWJxq2GeSJRzIPmzcfb1BQzHv3/WLV6LhXpZVKsfr5LsEzVdkOs5/cbszqFSj+6Z
	RA2XxWmZy4k1EZql8xN7xP6avQF9NkO3TB39xZYwuL7/2JKkU8OXjPO7ZVXnV6JQ4v3AmSv/K+bS5
	mBgKKM8gCu/0A91B2lU4z9nDOu8SE0b1VsGX94H9ywBxqTxR9+4uXXal1y8bYD6Dcd8FdDlIPJ0+H
	BzyBdZikRx8eR+Rs9hipTlQz1zmuSJBhSA2ar9Rvpy3yzdFMYiB5ElKITpiYFeGCuKqp/IQkSqZwy
	cqOKm4dPo92pg1A12Yzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrudP-00AVca-HG; Fri, 20 May 2022 04:53:07 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrudN-00AVag-Hv
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 04:53:06 +0000
Received: by mail-ej1-x636.google.com with SMTP id m20so13443829ejj.10
 for <linux-mediatek@lists.infradead.org>; Thu, 19 May 2022 21:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HelS1YSgoBW0SE2UIxwjEVxXmUoAGRP6Ud70VaUb1RA=;
 b=H6iH3aexSzoRS3xXyRLeJheX9vWo0LSI92UAWGJj3vVnikNVcBAUVV//3jW+OoHWMo
 c6QuxxhcpXAZBwmBxi7/BCYKY2HuDVbJgHBMKEtcou/69yjh3SsfubfIpwV8ZiWSmLnM
 9YQff4597xej1VzxR5vTD6CKVagarFZCMisUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HelS1YSgoBW0SE2UIxwjEVxXmUoAGRP6Ud70VaUb1RA=;
 b=BgscqSOnRWHBS3UUPBFW8GsiGzgLDBUpWuB85hdk94e3ZRJAA2VslL5BjMGof5bY1N
 aNo768hW1tPg1/QfxdneKhnleFJxKdqaMn4/6netFzFJTKscf0lDcZ6F8A24DFr2I4tt
 b+t6myLGMvmILhttalqkgB2/Yd1S+KcB8BzIsiaTf9dCBHqFXanRXe60/GiG5IkyulZ4
 FnoRij5iCfCAe7kcQBGKxt/kBxnqhY+H8fEhf5BZLVTT7Ov8DeFPoS8zdJBm0eUmoxFW
 PJsoBnh69v0dl+5mrftUZG3Sn6Bgyf5GvWgHutmH3oQIipE0tUfZk5f8RU+MMD9W0/Lx
 Swjw==
X-Gm-Message-State: AOAM5331WHjP69MHfIOtKCOqXT+9A7HQILgX6Okih5+uE7T1bTPtWMDD
 V8gyqcrFhLvZcrmKcRA/m1t5zvetkh5Cj+lEBEfjNOKhSb2oUQ==
X-Google-Smtp-Source: ABdhPJx//tzm42OLUTVgIaPY6+uQ1fk21PSPAoxge18XjLdO9zIresHOvI3h20PeWG9DGgGmlfuWizAbefFCfNTPqQQ=
X-Received: by 2002:a17:907:c12:b0:6fe:22bb:7a0 with SMTP id
 ga18-20020a1709070c1200b006fe22bb07a0mr7327804ejc.450.1653022381201; Thu, 19
 May 2022 21:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220519134728.456643-1-y.oudjana@protonmail.com>
 <20220519134728.456643-2-y.oudjana@protonmail.com>
In-Reply-To: <20220519134728.456643-2-y.oudjana@protonmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 20 May 2022 12:52:50 +0800
Message-ID: <CAGXv+5GNoi_e2Ms3rcTTZ59k+_TZOB9qBM0p_BtE8EtDKYfpOQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: mediatek: gate: Export
 mtk_clk_register_gates_with_dev
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Miles Chen <miles.chen@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_215305_651356_779802A1 
X-CRM114-Status: UNSURE (   8.10  )
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

On Thu, May 19, 2022 at 9:49 PM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:
>
> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> This allows it to be used in drivers built as modules.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
