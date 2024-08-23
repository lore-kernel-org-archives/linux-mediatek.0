Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE83BC531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 17:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93UYZNtsycP6f+B131FhdRCqvOk5pQ/dX6SuPovTZMM=; b=D1i8RG4cwM0gqeiKG4AJmt3CYo
	GIuSwhWgmopk9LlnFI6L2hmol2aAA1jZRSVj7qMUjHNbI9brUMTKeV0IWuHD4oS4HiMu+NoR5DaCs
	BwBgb8Eg9tod/ve85w06JuOGG0jbAuY7+t10g+1m4YVdPAK1DTHUJ/JFSxYK4wPid6raJ1wtohajL
	5yg97X2CknU3Vm7+tvI+cYECxu+Lnq3hQIUiu0T7cjhxU2DylOVXrF/t/1BGESpiJiY7nSw6O5DJf
	zRRIOg4dLkKznw9BHqs4CZ9lAUcIMj9eE9K87nNk2l8mmcLu3TgIu7Qt2X7fB6RCxx1uOn2hJLekI
	jaWqBhxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shXyg-0000000079Q-2bmH;
	Fri, 23 Aug 2024 17:21:34 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shXyU-0000000075N-3RxO;
	Fri, 23 Aug 2024 17:21:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-429ec9f2155so17951955e9.2;
        Fri, 23 Aug 2024 10:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724433680; x=1725038480; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=93UYZNtsycP6f+B131FhdRCqvOk5pQ/dX6SuPovTZMM=;
        b=hodDUr5JsDw4lT3lhsezfsOyjU9mMYYOUabemFMK621UTEhC2+Njn/HkttHBEdmX+X
         eNbfvvRtCQd5mvf+lM5XjX4Ih3N+PvHnJlHxB/uTbH2XBMfk5NlzQobX9HiRl5CRNl8/
         AMvfm68ULgzmJYY0CwYDgxvpr6f9We4hMlFC2bqVJCWdEgCO6yCaMZpuN1AZhTxeYxoS
         jW2V7GwLdjiw3wjfnYKhflscc+UcpRdNgM5VC+68YQ5Yz0fLT9fEQTVoGtetTQctb3EM
         M66DOh5iaqv7NHEhL+aTjiB8ZxlmDxAW2DNxF8DU6bXkk9TCTWLxFp2grApugPL+rscQ
         2Ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724433680; x=1725038480;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93UYZNtsycP6f+B131FhdRCqvOk5pQ/dX6SuPovTZMM=;
        b=im733PIuiRO9W2vPcXGy6YBpVy+gilMbWnyaU4EjGOjHol/TXrVQgIlHkqQf9MApOo
         rN51YijAJhf/8r/nrQR9yWlOUq2dEs9Vgqg54h06K7U2WygeqbxDIDks1ojVdBywGtfi
         RBB31dVJkB371HxijaEGJC6rybEZMpprlAGsTY694XMhBluHGfP2vnE9jMg5+FUvmxvg
         hVRollviHs36URkzj1XRpGWiJj9Q/vpdtV2yvSFuvueD+DX17wLmJtJGUXUuvE5+wEjx
         M3J2KBBbxLRv7Tdivh7bdP14hqPb9CMknekLxEpKGtf1pa4txxhN3d9fdpmKcgPLvPP8
         PcoA==
X-Forwarded-Encrypted: i=1; AJvYcCXlgrMuq27njkFhCyAofITwjxbfP+dFJDVJ1C07/kX+CRPwBSSLe9/NTeDCJwLum4h3lUaRF77gHAphAQCOA8U=@lists.infradead.org, AJvYcCXtKxET64jvu8ndaYKRxu7hFKvJUn2YMhEPIwDCVnutWqNePNoNg6vyLlBDCY6FEa2+nrPm5qYTjNqogCN0GGFE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/ZcdUrBGkEDFnNDTj6vCgBBc9LW6TcQc0I0gMMVTURR2ulnlt
	U3naefunlY3dkocLfK0x8V4P79I5zN1JBwEjXh3L7XNsj8dSLTQ/
X-Google-Smtp-Source: AGHT+IGref40zkb0IUvtDNwA0TYFbk5k0+fa5r9I46BPr609ayqKWhEfTU0CKdcojT+tg6DFwoXrFg==
X-Received: by 2002:a05:600c:1f87:b0:421:7bed:5274 with SMTP id 5b1f17b1804b1-42acc8ddcdcmr25250625e9.10.1724433679578;
        Fri, 23 Aug 2024 10:21:19 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-1-209-141.retail.telecomitalia.it. [87.1.209.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abee8d1d9sm104140345e9.22.2024.08.23.10.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 10:21:19 -0700 (PDT)
Message-ID: <66c8c50f.050a0220.d7871.f209@mx.google.com>
X-Google-Original-Message-ID: <ZsimBSqlc_NeRhZB@Ansuel-XPS.>
Date: Fri, 23 Aug 2024 17:08:53 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
 <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>
 <20240823-darkened-cartload-d2621f33eab8@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823-darkened-cartload-d2621f33eab8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_102122_890707_E1B284E9 
X-CRM114-Status: GOOD (  29.13  )
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

On Fri, Aug 23, 2024 at 05:14:30PM +0100, Conor Dooley wrote:
> On Thu, Aug 22, 2024 at 10:50:52PM +0200, Benjamin Larsson wrote:
> > On 22/08/2024 18:06, Conor Dooley wrote:
> > 
> > 
> > Hi.
> > 
> > > before looking at v1:
> > > I would really like to see an explanation for why this is a correct
> > > model of the hardware as part of the commit message. To me this screams
> > > syscon/MFD and instead of describing this as a child of a syscon and
> > > using regmap to access it you're doing whatever this is...
> > 
> > Can you post a link to a good example dts that uses syscon/MFD ?
> > 
> > It is not only pinctrl, pwm and gpio that are entangled in each other. A
> > good example would help with developing a proper implementation.
> 
> Off the top of my head, no unfortunately. Maybe Rob or Krzk have a good
> example. I would suggest to start by looking at drivers within gpio or
> pinctrl that use syscon_to_regmap() where the argument is sourced from
> either of_node->parent or dev.parent->of_node (which you use depends on
> whether or not you have a child node or not).
> 
> I recently had some questions myself for Rob about child nodes for mfd
> devices and when they were suitable to use:
> https://lore.kernel.org/all/20240815200003.GA2956351-robh@kernel.org/
> 
> Following Rob's line of thought, I'd kinda expect an mfd driver to create
> the devices for gpio and pwm using devm_mfd_add_devices() and the
> pinctrl to have a child node.

Just to not get confused and staring to focus on the wrong kind of
API/too complex solution, I would suggest to check the example from
Lorenzo.

The pinctrl/gpio is an entire separate block and is mapped separately.
What is problematic is that chip SCU is a mix and address are not in
order and is required by many devices. (clock, pinctrl, gpio...)

IMHO a mfd is overkill and wouldn't suite the task. MDF still support a
single big region and in our case we need to map 2 different one (gpio
AND chip SCU) (or for clock SCU and chip SCU)

Similar problem is present in many other place and syscon is just for
the task.

Simple proposed solution is:
- chip SCU entirely mapped and we use syscon
- pinctrl mapped and reference chip SCU by phandle
- pwm a child of pinctrl as it's scrambled in the pinctrl mapped regs

Hope this can clear any confusion.

-- 
	Ansuel

