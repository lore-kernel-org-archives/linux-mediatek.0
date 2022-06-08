Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B682DC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 09:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtJJylZAgrEnwraYNXyOuLWZFvtUa1yV10OwbQKSw6U=; b=MlKHcIrGZ+QTKG
	eY8m0qdSeilySyqbkJukMUtAns0gMwcKkEkg/YPvAGBEHMVBtJfxdHya/AdysOP+oRaJHQGOAGLuF
	YAZ/MSAgKMKTVT66J489yuCmYFkboDhqKT1Ntf+1D3LrGiCBu7Bdn9eO+jx67jEA9Ls83EgWILkS3
	tKailTz/hdYScWU4qxjkuToZjyWbFJLkdlC4RjD3ePS9wuEJrbzRqiMzdtOfDVw4S8epNep9xGMhp
	Dc3NrNmqa8GnNj+ln1rOYj1QKKvWrLr8LntnthF0KnpEMFbnElk7xBkpanHOI+gJXzkxs/5PpkTzj
	XlvZKStf/fkY0gwESAfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nys4R-00COzs-HE; Wed, 08 Jun 2022 09:33:47 +0000
Received: from mail-pj1-f41.google.com ([209.85.216.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nys4O-00COy5-TE
	for linux-mediatek@lists.infradead.org; Wed, 08 Jun 2022 09:33:46 +0000
Received: by mail-pj1-f41.google.com with SMTP id v11-20020a17090a4ecb00b001e2c5b837ccso23252871pjl.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jun 2022 02:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=3mAa+qEh4/jfutJ1TxAHiAnCiCxKpOm04PWu4D2bqUk=;
        b=vssTJUESJAewGyUlMAocfGHn7jejm2y6JYUX0kLR0/7YW8LYh5E0wlBfUGuxJKWd2Y
         srZYJbdh8uTRstW2eFSdUeVDK7NIc3vGyAcy4wa1bFDdJ5f/UqB6+5Gqy4IcZZNb3sUX
         lKHqaDbllY8WiWks8Fs14KxlBe2d/CoNLzvQ9InZOOdpaRytrSgH04AEWeM6Gz1jhyRH
         g7VenRwrlTxjKuzWtGUkaNHUDWs5uD1rxyQiubFe8ZNTGArNDgebEuZ389s9drTQdjx/
         lfPVyTRtf3duLIpgyELy4ChYzdHkDRHS1Di4RkI5HBBp+1trB43o02mQcxSkbv/1AmcP
         128Q==
X-Gm-Message-State: AOAM5300o3VlxeD8ot6omLunac+JjQoYe3/LhM9W42LVmVPasRM/p+Co
	XKo1UI6d+DMgouUbrsduNCTrsQ==
X-Google-Smtp-Source: ABdhPJxBrk9LmLklKuNqznjZxKlkynaLEB3hh2Mbvxl5e4tMEIfkOpur214mjwyKlvI9QsY8cDGQTg==
X-Received: by 2002:a17:902:7087:b0:161:88a4:db37 with SMTP id z7-20020a170902708700b0016188a4db37mr32743936plk.131.1654680823883;
        Wed, 08 Jun 2022 02:33:43 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id o13-20020a170902d4cd00b0015e8d4eb2aesm14318093plg.248.2022.06.08.02.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 02:33:43 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Roger Lu <roger.lu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Enric Balletbo Serra <eballetbo@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, Charles Yang
 <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, Mark
 Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Roger Lu
 <roger.lu@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Guenter Roeck
 <linux@roeck-us.net>, Jia-wei Chang <jia-wei.chang@mediatek.com>
Subject: Re: [PATCH v25 0/7] soc: mediatek: SVS: introduce MTK SVS
In-Reply-To: <20220516004311.18358-1-roger.lu@mediatek.com>
References: <20220516004311.18358-1-roger.lu@mediatek.com>
Date: Wed, 08 Jun 2022 02:33:42 -0700
Message-ID: <7ho7z37b49.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_023344_990950_2F306340 
X-CRM114-Status: UNSURE (   5.83  )
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

Roger Lu <roger.lu@mediatek.com> writes:

> The Smart Voltage Scaling(SVS) engine is a piece of hardware
> which calculates suitable SVS bank voltages to OPP voltage table.
> Then, DVFS driver could apply those SVS bank voltages to PMIC/Buck
> when receiving OPP_EVENT_ADJUST_VOLTAGE.

Tested-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
