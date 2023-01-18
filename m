Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B99DC38147
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNS6eiGHbygAPEjwKzCdhJHEUCYd2KE+a83PDdTHehk=; b=shJreznDh1LMul4ZH+IwAXEQTS
	msY4VGbCu9RKrOW1IPagpDue8J3t5zIj9pBJtidqoG/m+z4ZMLx7Otw+QIdhmTwLhB3IbE8whBgwd
	UgSbzI5uhJOil2/Q/kCIohUTYKT3PR0U9qfg3noaeLL6MnOTIY/5fYcgDmcPdPdfnxPNMxJ6LFJTk
	NWa43AoGU/mfnp/7254hr5Cg8YHfu6rLYEj7NCxxUpJ8deRA2TbEjxGl46t6EJh6ogVXixgTEvBWS
	o0Sn+QVURH74/kKw/jJMCaPx29FcFuJQ/GLIGluPOozXEb5ZmR6ekZEUR5NXOPiQieJAJc4TZoXWJ
	JU5PUzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI9ac-001Mpp-6L; Wed, 18 Jan 2023 14:38:58 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI9aB-001Mej-K2
	for linux-mediatek@lists.infradead.org; Wed, 18 Jan 2023 14:38:33 +0000
Received: by mail-ed1-x533.google.com with SMTP id z11so49915560ede.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Jan 2023 06:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bNS6eiGHbygAPEjwKzCdhJHEUCYd2KE+a83PDdTHehk=;
        b=XQz8nBzO6ssc0BhM0mHTU4Ee9cGY/nEF9rDFzsVgIw1SJeNYIigeUYr5c/RHFjCQh3
         mO6Yh0EoHw5NR/lWgI3NGtZbHwUvAg5KiyAOOv00OT0yLA/ajYqJ++jHEkg/pc+zO81S
         cf9EBiXWpLP2i2JYAg4pjh8Lca2+9gxAvzIu2TgJg0f/k6F8n6IIAmoyHqKygdtUmjza
         C1tqTtmh7MfSy86n8BMT1bXOt2Yl3cfkCDwdbe4AJifEZMfhC3bnpwXSeWfgnozVGO6g
         3AlrVRnuntM6C8rMVDq51hACHSIot1L4aOPESjBWD/tRxsawdKZtBQx5p4ubeqyyQ3oE
         ek6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNS6eiGHbygAPEjwKzCdhJHEUCYd2KE+a83PDdTHehk=;
        b=IyeMaA35rEY2WQju7vUjEi/NcHucugoM8xE5ZwWmQzG0R1jvrFPI4iIWjwFFKJDbyK
         x0Wwq2DYpYuczxQ0IA7TZABaQN4trGZP4zRg0ATZPypfisRQVyrD7jABr/5sFV4E6Qv1
         gQobf/x+XG4jklHJsl7LsROh2L4wDkVw23/dY4/RCF9XW6tHdzDxOQRsC5or13Ph+oWo
         xB1nnTUQ8o34b4ccJfcyhFvrHnAKfp1eCepuGXxwhStfY2ob8IAh0Bi4YVVuNhZhItfy
         iAodx/z59UDcuSdJOlPI6mC3ENbdIHuh241grPAYlJMAQ/cnx9HcVraYMLZXDsKTvArv
         mU4A==
X-Gm-Message-State: AFqh2kpVOvxOyXfbm72W81BFTNXhoq4YOWhxNhnbihPs3Q1ttTH32NdS
	M/tLvwuyoSBcgFtNu919q/AY9YevOE+Tmd0Pvjo7rA==
X-Google-Smtp-Source: AMrXdXvD7QlyuufONbPUVTnt/WaVr7FKTorLy3QtyD7HO+AvLys9OISk72Se8sYBY5zkCe52Ol3FTyondDwwMfQ4Gj8=
X-Received: by 2002:a05:6402:1:b0:498:dfe5:49aa with SMTP id
 d1-20020a056402000100b00498dfe549aamr561038edu.398.1674052710126; Wed, 18 Jan
 2023 06:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20230112152855.216072-1-bchihi@baylibre.com> <20230112152855.216072-5-bchihi@baylibre.com>
 <feab4ff4-b874-aa10-2031-ad6b84cbc004@collabora.com>
In-Reply-To: <feab4ff4-b874-aa10-2031-ad6b84cbc004@collabora.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 18 Jan 2023 15:37:54 +0100
Message-ID: <CAGuA+oo5HcVNoCvDxjHhxZnRc5o19V6iXPe4kBPiA8rTHBoAAA@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] thermal/drivers/mediatek: Add the Low Voltage
 Thermal Sensor driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org, 
	rui.zhang@intel.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	khilman@baylibre.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_063831_702137_C86770E7 
X-CRM114-Status: UNSURE (   7.46  )
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

Sorry for forgetting this comment.

> > +static int lvts_ctrl_initialize(struct device *dev, struct lvts_ctrl *lvts_ctrl)
> > +{
> > +     /*
> > +      * Write device mask: 0xC1030000
> > +      */
> > +     u32 cmds[] = {
> > +             0xC1030E01, 0xC1030CFC, 0xC1030A8C, 0xC103098D, 0xC10308F1,
> > +             0xC10307A6, 0xC10306B8, 0xC1030500, 0xC1030420, 0xC1030300,
> > +             0xC1030030, 0xC10300F6, 0xC1030050, 0xC1030060, 0xC10300AC,
> > +             0xC10300FC, 0xC103009D, 0xC10300F1, 0xC10300E1
> > +     };
> ...what is this long list of commands?
>

I can not give an answer for that.
The LVTS programming guide is short in explanation.
It just gives this code sequence to configure it without any explanation.

