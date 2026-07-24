Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC2BC53200
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 12:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQ+KH6/Owg7d0XhCktRva+QCZoo/0HA00/3GV4nmC8s=; b=rxn4T+2b22l0SeB4ToM7bjclfn
	dSORlPywi7JP4jjPLU1CaSL1GLUp1V3858UPOEGO52EfGYBRSQpwFAEeI2jLA9yIS6wg/LcDnejXg
	QAm08u1haZh3LZ3/f+z9qtBZuB3FA+8pQYNN6FNvzK+XKXeF4iEe2KL/j2LWarNL5b3L7iC6Scgdi
	aN9WikdYCVYfLgrQaFhN3/HUiD7KqAxeTlBgROPMIUF/ofrdZTe4N3cM5/duThIN10vkD6wHGMDNI
	ex8IwGb45PMXe+TbS1yClXGsf4wuN30v7oJA8aAnlK0J/nlUGvlXwDroeXlq1E/syGResyZOZzTDT
	1aUInhfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDuY-0000000GGx8-3Qf3;
	Fri, 24 Jul 2026 11:17:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDuX-0000000GGwM-1GGr
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 11:17:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 879BC4512D
	for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 11:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519131F031FE
	for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 11:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784891393;
	bh=GQ+KH6/Owg7d0XhCktRva+QCZoo/0HA00/3GV4nmC8s=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=UJJUlWLOVXOeCmcSW84m67zYdnKUKmMGfrnvqHp6qCvbxBiU2+49GTxixI96xOQA/
	 7N7iXlEMvS1O21GL50BBPAUXELLhcHdlMPE/VW6acs9kKTZnru4L1PxgfXPPsm39cR
	 QGjXvaNelrxzx7zOfioXWqNoowXej7DrJuCCc04inumEFN41WrcJMVoecS6rH2BNdK
	 MExrX/jRqM3/3tThzO+OjhfVBEXq2DZDjrfCl/Z2slG6/mpyuVTV54kaAI7/lqjupN
	 zh15uOXFKEHriV0V27rcfzSI2LuAekkPlHpEBVjunfc0j6oAlly44wywe+pS1FDDLA
	 PxT35lP7eLoDA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so322602e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 04:09:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrGIZeH5GE/L8YIlxBfhQZR6zTpxHq6BeWb9XrWZ198AzOmhWAjJL14m9F1znTpXNgmLc2fQn1E2I0uD0xaEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOoTtSjMZAPJUCmpMr/XLSY2whsmBYgH15DomHOmJ4apcN6SqA
	kYI3dZ6PZ/M3KlKz7Uj9QelCJigp0kpH2JafB94fpR+/wblKEqNqHVyZZCz1RjMUSRkyGwP68XH
	gUWX+ADn6/0TYjzKcwrA9J/HFBNSraAJFe30wASahOw==
X-Received: by 2002:a05:6512:128a:b0:5b0:e14:777c with SMTP id
 2adb3069b0e04-5b2b2f667a1mr1625122e87.22.1784891391963; Fri, 24 Jul 2026
 04:09:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 04:09:50 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 04:09:50 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260724084328.3943997-4-wenst@chromium.org>
MIME-Version: 1.0
References: <20260724084328.3943997-1-wenst@chromium.org> <20260724084328.3943997-4-wenst@chromium.org>
Date: Fri, 24 Jul 2026 04:09:50 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfV7SeG-jJ8YdS=aRabCUvP0PV5=8QL=AdCCsnzyKq1QA@mail.gmail.com>
X-Gm-Features: AUfX_mwiB4kLYEiWsY_exPz74ryChUmU7NeF3R9wpx0QdX4G4TNw4501T3DhVLY
Message-ID: <CAMRc=MfV7SeG-jJ8YdS=aRabCUvP0PV5=8QL=AdCCsnzyKq1QA@mail.gmail.com>
Subject: Re: [PATCH v7 03/16] power: sequencing: Add pwrseq_get_state()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 24 Jul 2026 10:43:12 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> The power sequencing consumer API already does power on state tracking
> internally. Expose the state to consumers through pwrseq_get_state()
> so that they don't have to reimplement it locally.
>
> Instead of just on/off and error codes, the function can also return
> "unknown" state. This is in anticipation for "uncontrollable" power
> sequencers (such as GPIOs left unconnected).
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

I'd have dropped my Ack with a change that significant but it looks good now
so:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

