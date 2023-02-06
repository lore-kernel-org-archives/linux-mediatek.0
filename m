Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E871C05027
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rwXX77gDObBsNSKOYPKq8KrSqNKeQDtYRqpUJ33YBs=; b=Toeum1YMSwJSXoH0KYWghoBwjA
	iEfK6hRczp1UP0FiL74iYJGAWutVB5x+/zhN8gbturXeygpX8EXPZHTuAz9BX/mvvCAAYqWRd3n9O
	taKLskEUGFFlCwqFgulRjOaE5j/+fWxhu4W4BGAH9yyAWpsgSaRsVUQQYlSMBW8MB+xuRYmWJaqCf
	V+RdYxAURVbh2/V/dVhSiMvHwlXsm6kO2OmOjoufhEQ5BUMze3fM7vHN0mkiBvnjtnqp6wgJQbTdU
	SKftP0Ocs6TUuKUAP0jvieqReqpai0Br/53aSNz1kkJ9jDEqoacC53EwGvJIh0cltzlRIrq8hWRwk
	iIbOVOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOzVe-008GYx-Qe; Mon, 06 Feb 2023 11:18:06 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOzVc-008GXx-00
	for linux-mediatek@lists.infradead.org; Mon, 06 Feb 2023 11:18:05 +0000
Received: by mail-vs1-xe31.google.com with SMTP id e9so12271472vsj.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 03:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/rwXX77gDObBsNSKOYPKq8KrSqNKeQDtYRqpUJ33YBs=;
        b=jCUFeCsz6BfoHukI2ABxuTMF6frheMup3DbNltf74R+lX5vdhqT82KSrIsPkTmAlqH
         P9WTfXjQBNReHstzUK5VCcyNK8sTRGc5acp/3EmbWQzJlaJUOh88/8ukFH33dUUZDNq2
         VvrIM7vGnUvJtzPpLYx5Lu6VhhkmPBtsUaij8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rwXX77gDObBsNSKOYPKq8KrSqNKeQDtYRqpUJ33YBs=;
        b=u/wyIKpsd9lsxUDEzGRz0i37Nm61oiXhzin78CG1+vvnXhT+X3SeNbUMeF1+i3lxE4
         GaTg40wqo59x100y6WC7a+6fSZZYmn1HJ2Fyd3OuTqTtVmpMkhOUOtrEbmPsPXqKaJ9v
         JrYkia7UyfdMOZimsWPs53NlO3gyzbguhVz8C0IAO0/WcolJLyxxTRsELDqw5pfrfWK6
         /flJ+liAfA0TOokkdoeo1lh3XxvC/3MGxpyM2AGkY+vVDseYnSEsu8I6mO3MhVzK6hm9
         uY3lC7L8yjK9fU8W+x0NJw5oeHReFGsKks1RJWd+G+EDZU/iHhzl4ngJSj/WrCRG+muf
         ePOA==
X-Gm-Message-State: AO0yUKUlxFtIqckprm7cGPxBnMjyNI9c9ipPFNVo1a1LL19ax1kSwhlR
	bkRYbEM6xH1I1cygeApUM6yV1Gc7UiJKvW2PSx2oiQ==
X-Google-Smtp-Source: AK7set/KGmltEInT6XzqPPO0IQbyeDjR6qLXf6JqdQTYRJiNedxftxWZahdnYF2TPrmK1NolkMQXMg26ZTZ9DH7wHKs=
X-Received: by 2002:a67:d21a:0:b0:3ed:2cd6:deed with SMTP id
 y26-20020a67d21a000000b003ed2cd6deedmr3458075vsi.65.1675682282519; Mon, 06
 Feb 2023 03:18:02 -0800 (PST)
MIME-Version: 1.0
References: <20230206091109.1324-1-moudy.ho@mediatek.com> <20230206091109.1324-6-moudy.ho@mediatek.com>
In-Reply-To: <20230206091109.1324-6-moudy.ho@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Feb 2023 19:17:51 +0800
Message-ID: <CAGXv+5GFkNmH=Ltb1o+9eB=4+FfuNk2T3OGk1zWjsrweGbzKkA@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] soc: mediatek: mutex: Add mtk_mutex_set_mod
 support to set MOD1
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	"Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_031804_070008_5E73C4B8 
X-CRM114-Status: UNSURE (   7.78  )
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

On Mon, Feb 6, 2023 at 5:11 PM Moudy Ho <moudy.ho@mediatek.com> wrote:
>
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
>
> Add mtk_mutex_set_mod support to set MOD1
>
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

