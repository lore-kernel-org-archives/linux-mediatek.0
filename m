Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E10DC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 18:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epB6zTfweVmmiNYmsWHbb08P5JmiAsWOLYyFnL5+8DI=; b=ToOoWK1J/vIbvW8Po3rEo0D7UY
	3GaUDVdkonFOEOlhJfDvhK6aGKsSFyyOX8RV8NfbWXB9pn9rcI0Ua0pVF/M/JVjE0fhOUA9p6cSeQ
	18Pvr/rIy2WFZ+lWou5OaOmDlcXw7WtgOrUjn1pTKEr2s4E0RuJxaDBWQVKNuC8ZrC774aMawt+uc
	oANGdx7bBmOcmaOiZLsh/L495x0VtJ/zojRixF6SzOF2qC4nXGchRMR6lZDoG2xsMuh+WRnnFSxiJ
	UcP81OAkPndrlcs21QMwysbIxQiDOVN/fnQHCEO/Kw4N7B4XE8IGyf/Yp+G4xGTKjI7nfiYgUQ1BH
	2sLJrIig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4npH-003s1t-OO; Mon, 12 Dec 2022 18:46:55 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4npF-003ryH-GO; Mon, 12 Dec 2022 18:46:54 +0000
Received: by mail-ed1-x52c.google.com with SMTP id r26so14249980edc.10;
        Mon, 12 Dec 2022 10:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=epB6zTfweVmmiNYmsWHbb08P5JmiAsWOLYyFnL5+8DI=;
        b=mGiOG00DH7d1okC6HYRO1b4PT8S/5GYbqOgvUgMj17hjC878FhEfbbxutHxkemnqhX
         JNkbmcRWAIRH1kE79m8MWAY/ihzftkITk3I3KuJyMy33gNh6bjp1PPVCzKDN76WNplGW
         rXGWew94o0wZPWDMio4uDYvXVMV0LHg8SEepYk5eSpUvnfZAYGLVzeFWkch0R9gFxGmb
         +EOgWrHvAnW5g3Tyz6ln0DN7SCW27U65oY5gMwJ68gdpz/pU9fBr6cZr+FD9ECiZhOL2
         XoKznJx4pSJ0PbhTvEvTWpYkqPfSesi+WfU44as+TurmpKi+8dHr7ikJYOiRCUmTJJv1
         TbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epB6zTfweVmmiNYmsWHbb08P5JmiAsWOLYyFnL5+8DI=;
        b=IhXFkNAeCr673Ji3kISH8eUOwHyihnTjFMkPr0WzHzdPNPPKoGuzLO2JGr/D79pods
         Pp8tn9PujT8XnC13l6fOdKLshh9DCM7XUDSMqm8qw6XNJbIY6RivQV2VZ66jxTfsJr3z
         MwSXeqGgntxIFEDTHt1rN02Kr1lpaN0LhwqJUO+0JkmLSmG2lA0uOuOIWA6kO85TnYJX
         CocgDtp+ClnNYUoaisU+ickOsgo5jlwUh6g1P4MGu04RA8DH5X/92XsumxpS8NWpNYG7
         aDrskizzQ3Ong2hw/ZA6chGT4pSE3I94RpSjRqLv+cLjQYkJfZ6I/GLY5xq8w/PvxrUo
         o+gA==
X-Gm-Message-State: ANoB5pkkWiChrRdWpaUrZ8p7+NLIoli1EHiYgIRdECXbPxjKj0niEi4S
	U4blw3sVYP+uMb71Js3xINw=
X-Google-Smtp-Source: AA0mqf4jJTq2z83SlkLf5ctkhS+SAdQuYrAJekO9bKZrsoZHWmAkqlvsQJVIdrtwkcS/sFObZsRuVw==
X-Received: by 2002:a05:6402:3895:b0:467:7775:ba8 with SMTP id fd21-20020a056402389500b0046777750ba8mr15155363edb.1.1670870809782;
        Mon, 12 Dec 2022 10:46:49 -0800 (PST)
Received: from skbuf ([188.27.185.63])
        by smtp.gmail.com with ESMTPSA id l4-20020aa7c304000000b0046b1d63cfc1sm4081207edq.88.2022.12.12.10.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 10:46:49 -0800 (PST)
Date: Mon, 12 Dec 2022 20:46:46 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Marek Vasut <marex@denx.de>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Linus Walleij <linus.walleij@linaro.org>,
	UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	George McCollister <george.mccollister@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 net-next 03/10] dt-bindings: net: dsa: qca8k: remove
 address-cells and size-cells from switch node
Message-ID: <20221212184646.cb6y7rd7g2nzekh4@skbuf>
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-4-colin.foster@in-advantage.com>
 <20221210033033.662553-4-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221210033033.662553-4-colin.foster@in-advantage.com>
 <20221210033033.662553-4-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_104653_568124_462996A4 
X-CRM114-Status: GOOD (  10.46  )
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

On Fri, Dec 09, 2022 at 07:30:26PM -0800, Colin Foster wrote:
> The children of the switch node don't have a unit address, and therefore
> should not need the #address-cells or #size-cells entries. Fix the example
> schemas accordingly.
> 
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

