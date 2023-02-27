Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15064C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 08:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07+qdTDQ6UBJE1ppAUMQ9P0jdgbB7pl5uWXEfVl4Vtk=; b=dQNOnx22mka/YdtkFHArjbP6vM
	PGGBsIIOJu5rpG5+tDhuN7KXBRE8iffd0epnK7S3ZbDikmmw0OxtWavsSnBTpXpqhwzcn6Xc4dbpl
	OjS5k/ttoGAsLjkZYJKsrMeN0mU8C5fqc1g0eFabH2JkwhPNl2mToxpVOCgh/7Z8htGiY8v3Sg6vs
	rbCSQxOPD9eiF9eW4kZt8Cb89wT1wZfW3l95Je3EISgRiKtiVTYzhtToLI3yvY9VgtMPhSyoKFIaW
	B0q38Oa8cCDbUq1lTupQD9ZLzm38LN4nQrSDSK0uinU1VhfIUPgdYk8I9qXZh5r52GQHiXMI9x2Lm
	RUWabl5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYtP-008qjy-1L; Mon, 27 Feb 2023 08:29:55 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYtM-008qiM-AK; Mon, 27 Feb 2023 08:29:53 +0000
Received: by mail-ed1-x534.google.com with SMTP id h16so22266156edz.10;
        Mon, 27 Feb 2023 00:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=07+qdTDQ6UBJE1ppAUMQ9P0jdgbB7pl5uWXEfVl4Vtk=;
        b=PdYt7oEElXres1wTHUrJs0HhWeO98wzJ9CWly9kW6imArKG1ucr7eFri/kFG0u4D9o
         IOEmZAILEx7y5UXi+4dV9d36NyK0hmfAtH5LZhWJEnUJPrbgA5BPF1GAQ9i8iFF/1GFo
         TA/NMigaHCDOW8vMg0LR7S83IMB/n/doN0RAUObgRDzfnhylR4g/qegxJssiugwDSYds
         wYGZtNX/EP4Iy9khTpNJ/A4P4HhpP+Ux+tGRZ9uZ9r7lVkyVk1duONUvdVxS3wzduJT0
         nXlgAujayHG4snkp58oz7nYqWav/KaVM7JHVi9L0v1eACwLXy1IUP/NGz8SVllyN5J4G
         5pAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=07+qdTDQ6UBJE1ppAUMQ9P0jdgbB7pl5uWXEfVl4Vtk=;
        b=j6M5x2YR4UiSaVs5s4IiYh1f6Lx6rrg0cSwKLBvOM6aT/2VGMlScARfsfK4bYg9fT5
         6uk/q4Zcer6ZybEoflLo3zL3ntnnnOj3b+wCs51cX8EG+yDJvvBXh32UbYneGdw7DvMj
         MJL1bDtbmX9h3MX4CCQbQ1dVmFsqIzYI1+cKgXtnXrFZV9uLbKzXOWPCldk9eQU/SD/b
         hxSom4/PW0BdOjHAtLBbGcfLW5nQ21FXNK5OWPVDBdX7/md02f7EScoX642RgNhi5PRU
         3E6MHuZgtKdnMujD5WP3IoGrczqR1HBstP0XWlDSP465AiuAXetStataR/eNWfFYE8wo
         d3LA==
X-Gm-Message-State: AO0yUKUZkne7wiZqjHt/jZON5Vj9WL2B7/RWLVNhin2+x9/y7j94J/yC
	dS2U4aPyHOGuXD9VpxlOzWM=
X-Google-Smtp-Source: AK7set9HQ4ELfhFlAbdj5+Og+m9HexOksW8t+xT3bndkDTCmcqH05zqH4lnjwZoNhTBpFC3gadonOg==
X-Received: by 2002:a17:907:94c5:b0:8f7:68ca:c004 with SMTP id dn5-20020a17090794c500b008f768cac004mr12022799ejc.64.1677486589371;
        Mon, 27 Feb 2023 00:29:49 -0800 (PST)
Received: from [10.33.2.246] ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id p25-20020a170906141900b008b30e2a450csm2971396ejc.144.2023.02.27.00.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 00:29:49 -0800 (PST)
Date: Mon, 27 Feb 2023 11:29:26 +0300
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: Add MediaTek MT6735 clock
 bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Daniel Golle <daniel@makrotopia.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, Miles Chen
	<miles.chen@mediatek.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>
Message-Id: <2XCQQR.YSBPBN01H6D31@gmail.com>
In-Reply-To: <52d479ff-14c6-b65d-952b-e7753fee2dea@linaro.org>
References: <20230225094246.261697-1-y.oudjana@protonmail.com>
	<20230225094246.261697-2-y.oudjana@protonmail.com>
	<52d479ff-14c6-b65d-952b-e7753fee2dea@linaro.org>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_002952_375331_90D38EF6 
X-CRM114-Status: GOOD (  11.45  )
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


On Mon, Feb 27 2023 at 09:18:45 AM +01:00:00, Krzysztof Kozlowski 
<krzysztof.kozlowski@linaro.org> wrote:
> On 25/02/2023 10:42, Yassine Oudjana wrote:
>>  From: Yassine Oudjana <y.oudjana@protonmail.com>
>> 
>>  Add clock definitions for the main clock controllers of MT6735 
>> (apmixedsys,
>>  topckgen, infracfg and pericfg).
>> 
>>  Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>  Acked-by: Rob Herring <robh@kernel.org>
>>  ---
>>   MAINTAINERS                                   | 10 +++
>>   .../clock/mediatek,mt6735-apmixedsys.h        | 16 ++++
>>   .../clock/mediatek,mt6735-infracfg.h          | 25 ++++++
>>   .../clock/mediatek,mt6735-pericfg.h           | 37 +++++++++
>>   .../clock/mediatek,mt6735-topckgen.h          | 79 
>> +++++++++++++++++++
>>   5 files changed, 167 insertions(+)
> 
> You should squash it with other part of binding. What is the reason
> behind splitting one binding into three patches?

It seemed logical to me that each of clock and reset bindings as well 
as documentation would be separate parts especially since they go in 
different paths, but if combining them is how it's done then sure, I'll 
squash them and resend.




