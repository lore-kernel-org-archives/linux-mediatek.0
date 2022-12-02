Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4107C4321E
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 11:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8oIXI7Gl5Ev+i5ApjJf4B1139RK0U5wYzKaGEnlId8=; b=fUlHqIOfGAixkbEpmdlFiGoacp
	T8P8ZD02yViYpWT/ag9WoudSDxBrgSMc4F2Xtythcp/iJSUq7rwscJJihAZ4MxWvP27AKvwDA/QSu
	BXRz8sZLFEX0qimMbJ8hQCoiS6RE2A0vr3mTVQbTGia7bw5RpHX+4drXgQ6hnIlywbFH09L0Uitne
	C+Imf7p2CN9ujAaoHHnWT5WiTNIRnbHU2LSjSGF6qgjj8txehivG8Mqb5Srg7Hsd1DU/J1+lxF+Ga
	PpHU6zKEdRlwQZW3jkGB4UESLgLGpc7u8XJOsqeY3MXrhgL2omJK4MyKoJOELIiWkjgdQubsUyz01
	XCj8KbAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13ns-00FpLY-9w; Fri, 02 Dec 2022 11:02:00 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13nd-00FpDz-BQ
	for linux-mediatek@lists.infradead.org; Fri, 02 Dec 2022 11:01:46 +0000
Received: by mail-pf1-x42d.google.com with SMTP id w129so4586219pfb.5
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Dec 2022 03:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M8oIXI7Gl5Ev+i5ApjJf4B1139RK0U5wYzKaGEnlId8=;
        b=avwdmFPuRneeA3KhE8NokWJqbXBFQUFRt+Le0emrAqH6JCX9m2f+I4qwYEG9qWBHfT
         WJknGmyBaCWEHq/PHJ8dJ6dJQto1+pHiS3GieU+GSesq7ex+DgozS86v37eb9Kb+qs9q
         Yb2rM6b+8cNY9aJFqDBHIDHe+eXtG9+MiCXKLZs0x/70mg1lS+FF2IBaofX+SQWF50J6
         l00EgXHKzbSW5ZcI3w+YDo8WgdAAvI3wy1Y545B985jl6vDhXjqwAFVTlaaX4bREP+fX
         nteliqkMaovhvS9EdCcEjIf8Nk75NJTZADRKgLmQ0JxKUarxgwQQ3+oEGB1nOk5rHP4d
         mhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8oIXI7Gl5Ev+i5ApjJf4B1139RK0U5wYzKaGEnlId8=;
        b=aVVFJG1hF/udqP0hFuGfNqN/Kz7qbxaZtZ/Pb1jjy2fosIfSwSybQY1J38zqelmx/O
         Cb26W48syZmW62ePtqN7IV7pn22umW8bCbCawwtReSSM2l44IB16DD4NFqzhcDcQP/OR
         NqsDqqEeuwir3zNbgDumI105TX+0Qg+WtyV+cpX7jouXEG/Hc3XYhf5z/1Mmuu+NBU7K
         E41i4GQjimXaLpTM4d/TweWVpqqxwU8gn/dGxbT0ucY8j2aOCCgKZXpp1+IpPm4tBkpo
         1a4XBJ6qTtrnVVSmB9zRrmtWuReI/8fkdJ9SNTZIk/qkXqlBvF+UqQmzIeEZuaL3/mFJ
         x0SA==
X-Gm-Message-State: ANoB5pny3mo6PK9ruxgAC5kxICbnRqCQmpo2D5BSwkKLNMfzspGufyJA
	oVsgtTV+QIkqADP7FFKcJzNY+A==
X-Google-Smtp-Source: AA0mqf6krRyOgR/NF3iJ1mIRdAiblHmqLcgvZJ/2SOOQuX//EFRr0Lv9KilgJukZF+G+kVQsuFqUdQ==
X-Received: by 2002:a63:ed46:0:b0:476:e11d:8d51 with SMTP id m6-20020a63ed46000000b00476e11d8d51mr47557303pgk.252.1669978902476;
        Fri, 02 Dec 2022 03:01:42 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id y2-20020a623202000000b00574740c99e9sm4834948pfy.129.2022.12.02.03.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 03:01:41 -0800 (PST)
Date: Fri, 2 Dec 2022 16:31:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: Kernel Kernel bug caused by (cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()) on Banana Pi R64 (MT7622)
Message-ID: <20221202110139.vmwcmoudakm2nap4@vireshk-i7>
References: <02c2c955-940b-b315-0474-85d0eddad7a3@leemhuis.info>
 <Y4jHvomTrU8guBox@makrotopia.org>
 <47a4665e-333d-a6e7-a2da-96cb06c2d87b@leemhuis.info>
 <20221202052716.uj3kzkunazmgazeq@vireshk-i7>
 <0ebef1a2-6b5a-04b9-a79b-79eb3349c32b@collabora.com>
 <c76bd301-0e8d-2d2b-0d3e-a57ece9b496f@collabora.com>
 <b1822bbc3775730c4cedf9652323c7d72e663e4b.camel@mediatek.com>
 <8be3e050-f32a-6761-8ebd-49c38dfcf9eb@collabora.com>
 <c186d104-43e0-ca10-3ce2-c2f922acd8bf@leemhuis.info>
 <37468027-6a27-dcb8-9c14-8f8426ec50d1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37468027-6a27-dcb8-9c14-8f8426ec50d1@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_030145_460467_20754BE4 
X-CRM114-Status: UNSURE (   6.96  )
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
Cc: Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "daniel@makrotopia.org" <daniel@makrotopia.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, Rex-BC Chen =?utf-8?B?KOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>, Thorsten Leemhuis <regressions@leemhuis.info>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "thomas.huehn@hs-nordhausen.de" <thomas.huehn@hs-nordhausen.de>, Jia-wei Chang =?utf-8?B?KOW8teS9s+WBiSk=?= <Jia-wei.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "vincent@systemli.org" <vincent@systemli.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 02-12-22, 12:00, AngeloGioacchino Del Regno wrote:
> If Viresh can add those while applying the patch, that's fine for me - otherwise
> I can send a v2 adding the two suggested missing tags.

Sure, no problem.

-- 
viresh

