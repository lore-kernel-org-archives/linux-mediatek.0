Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDCEC77B6F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LldlB1xQuvcrgZ19lm5xn8CkgAXkGiff2Tg7FMmL/4k=; b=BY2vY0jHS96I1yrtEdcmhRTXhq
	agyKtILXvLA6D3ZyU/nxKRn8oYH64gDG4aU4XHhMKDxJpPiBE6y0Z6oTkkSYOtMPDW33kCBmsmz/P
	jkyk0oh4YUo/ByDUi+hknOH2FNzGdjejRmlo2z7H6c/UwfcYSs9miVvIjhzwq62V6EDazpjFU9w3k
	rLlHFBX6lKXlDfh05KTURvvdytRh8m5c6s6IVgKwMI1dDgRllnIOMixIbQwFJpcYoOgb9dZ46pSCv
	F7Ufo0j4aQ3a+1I8CBKtk4p97uOdijt7KIgURKreHCSc+XcGHaFeBwANL0F7DYeAWZ3qahfsdkBpY
	rKTx13eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmFUc-000KWt-19;
	Tue, 11 Apr 2023 15:01:10 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmFUV-000KTn-1Y;
	Tue, 11 Apr 2023 15:01:07 +0000
Received: by mail-ej1-x62a.google.com with SMTP id qb20so20722955ejc.6;
        Tue, 11 Apr 2023 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681225259;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LldlB1xQuvcrgZ19lm5xn8CkgAXkGiff2Tg7FMmL/4k=;
        b=Yoo0aRfvEQK9F6//XhMwcVV+RaJVf4NkmUC2vXRokx0C5iOJW4xt9cfcuL0yvImJnh
         Vm4MfwyxKHUN0qdmy6YxROhbtNEwIRsgDd51T3NttEh3lo2kuE9Qej1vPaOgBO4ZtX8Z
         CF5IoI9CPjmU3s/wbSvAvjXy/1hKd0sUhuKxU/E41fDSZZCYl9p4BRyboPObBsHOMdR4
         WdzXlyWyERiho1Lrg/ur1aQEziorEXmLHb1qSXe/5nkVPCfYGvJ2Rgix0QNNgvljaB96
         LpW7VF49HtDfnDByk5NPFX6YBsIXLP1g0JiywB7PoQmiLoTQn5JzUVDH1G5YwsEUV2Pb
         LM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681225259;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LldlB1xQuvcrgZ19lm5xn8CkgAXkGiff2Tg7FMmL/4k=;
        b=emNBOpDodIfuGYJ9y9pB0xBKPPGRujLUNzMbI5xzL+J+pXmshHfJFQ/6Bumh7cw3bf
         +/YuF3vIweUEwf13HTzff+ZkfV5zZ1jNE6pVxrJBWi++xbqXClDyCFpkekC/E/l5I5H6
         yJ8IEBSN9DDneFzudrXVYAbS6HqJSwkGjbS0B/i5e5otDLnLpxXcBzoH1JL45+HFCHBj
         w+Ju1NFZj7ThlGtY4Z4j2kB6z8caJL9bbTe/jZFQQZ6LpVAKi/W8CbBudQyBmmw4+Ln3
         3jXo63HT6VDNNckRxff3Q/tasPwyLDUiFEVljh7kvdBti82cz9AXMXw2pGPxFf+yFfhx
         /eIQ==
X-Gm-Message-State: AAQBX9cWvmyavuCXYg3C5z4/Qt0ThBj4otpxuvSMcNjJuM4f5wBU+kCR
	/Rfi/hvRqsbgjXZbkMS0ruU=
X-Google-Smtp-Source: AKy350Zl/Ty0ZK+idvPOrU2kPQiMgREOiHAPnRD5rc3YIr69o7pJd6Fu4c/i+CEstt/RDWUoUHh4iA==
X-Received: by 2002:a17:906:3710:b0:94a:62e7:70e1 with SMTP id d16-20020a170906371000b0094a62e770e1mr7257462ejc.68.1681225259410;
        Tue, 11 Apr 2023 08:00:59 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id la26-20020a170907781a00b0094a8e06eaa8sm2124389ejc.185.2023.04.11.08.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 08:00:59 -0700 (PDT)
Date: Tue, 11 Apr 2023 18:00:56 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [RFC PATCH v2 net-next 02/14] net: dsa: mt7530: fix phylink for
 port 5 and fix port 5 modes
Message-ID: <20230411150056.2uhtoy6iqnt2qopr@skbuf>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
 <20230407134626.47928-3-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230407134626.47928-3-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_080106_185112_FAE78D15 
X-CRM114-Status: GOOD (  24.28  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 07, 2023 at 04:46:14PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> There're two code paths for setting up port 5:
> 
> mt7530_setup()
> -> mt7530_setup_port5()
> 
> mt753x_phylink_mac_config()
> -> mt753x_mac_config()
>    -> mt7530_mac_config()
>       -> mt7530_setup_port5()
> 
> The first code path is supposed to run when PHY muxing is being used. In
> this case, port 5 is somewhat of a hidden port. It won't be defined on the
> devicetree so phylink can't be used to manage the port.
> 
> The second code path used to call mt7530_setup_port5() directly under case
> 5 on mt7530_phylink_mac_config() before it was moved to mt7530_mac_config()
> with 88bdef8be9f6 ("net: dsa: mt7530: Extend device data ready for adding a
> new hardware"). mt7530_setup_port5() will never run through this code path
> because the current code on mt7530_setup() bypasses phylink for all cases
> of port 5.
> 
> Fix this by leaving it to phylink if port 5 is used as a CPU, DSA, or user
> port. For the cases of PHY muxing or the port being disabled, call
> mt7530_setup_port5() directly from mt7530_setup() without involving
> phylink.
> 
> Move setting the interface and P5_DISABLED mode to a more specific
> location. They're supposed to be overwritten if PHY muxing is detected.
> 
> Add comments which explain the process.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

We have a natural language processing engine (AUTOSEL) which
automatically picks up as candidates for "stable" those patches which
weren't explicitly submitted through the proper process for that (and
they contain words like "fix", "bug", "crash", "leak" etc).

Your chosen wording, both in the commit title and message, would most
likely trigger that bot, and then you'd have to explain why you chose
this language and not something else more descriptive of your change.
It would be nice if you could rewrite the commit messages for your
entire series to be a bit more succint as to what is the purpose of the
change you are making, and don't use the word "fix" when there is no
problem to be observed.

