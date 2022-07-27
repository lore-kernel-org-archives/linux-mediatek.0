Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AB3C19F29
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 10:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8/pL5RbrbSs+hHHBvRwGZbpYLdGvRQCLQtimUHaY/Y=; b=uGT2BQL8Q495nNj333ni+NjEkF
	n76yql9XlDxro5wLPBCJh/FmPcuK5DhLh7ovI+HD3XKv1VeaaBDQsrxjT8pYD5zQuTEFo1h0mzfFB
	k+tITvb8w3Mfl0bfGpW+1FEhqjjFROmeQLn6IOmHUuH7HLPCR4AFy4sAwaspCV0htUMjDGtXzy+Wi
	z793a3rBhah3V6GiOkZ+iXSEFC3hTb4cFPsZbLWe3dY/RLgUvNfmAodybTRADkS7H3PPHhUMPKg9h
	QGjldvSwLSK37exJ5jOhJhn4NoGAedEnKqis6I8rW64C28viG4jzrGUQUel3GkSm/WHOdgTUFCwzc
	SGZdsIDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeId-00CO0F-Uv; Wed, 27 Jul 2022 10:29:55 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeIa-00CNwz-Af
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 10:29:53 +0000
Received: by mail-lf1-x132.google.com with SMTP id q23so13244368lfr.3
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Jul 2022 03:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=C8/pL5RbrbSs+hHHBvRwGZbpYLdGvRQCLQtimUHaY/Y=;
        b=aEvVN8nlbsucKUUCJ/wUHJHSxHoLOa1riYAfbTUcji+KGxjKo9NUlmDFicJ8ogDpCl
         hMkK48WPOyIp8xI0oAvv3I8h3IrytxEr39XHdhKL/7ZUUG+/y5f2OxlKay0DfkAGdRQp
         N2nMntakv/nGUJlAmGxgOyUqTcPt03uwToXKvUh8SoNvTUIG7NPtBuFsExp66abTwW2V
         xdLYEHHweN3rL1XAL3L0kt/DdUkYeAdk/uySuf+B76Mu3lnzxHQAAfXvLCYxu/uAD4SB
         zcecCzzrdvFntUwwFrbRfekPUx5p6IWlfgTs0n3WGY6lrL4dWKOok5/Y/BbPpN5wHjAQ
         NkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C8/pL5RbrbSs+hHHBvRwGZbpYLdGvRQCLQtimUHaY/Y=;
        b=ywBn/MQ+rjpdm4yDecr6uJK9yi0Ml3iSF3tsfWOhoqnmU21BzmSjbLAEoUKJ6SXLGS
         2u1WETs5NV9wjo55hXqaihNcciI2fXXGP6/weq1j6EGyX/mBbFuIvzhXWgUJcVynUvbJ
         Ll0mdSCWFXuYX5Ku3EjtC7g0FGnRz1Nq9tHcfoo0yVVANxFmy3JBfXg9fUSDpFwZc5BY
         7Lf67u5emzbtPMnzFo30jv0zEeGkZP3CGke4RhbvByMvpbcaHJhvyOxMXWrOTST8/gff
         7414KqWY4mzGTPkUMv03pXqCoMjrupiRGiLiGUG6rMCYIf/vUfj974otDKm0NEMptPwT
         4jyw==
X-Gm-Message-State: AJIora/AuETeS2PnSSnZvnk01OKtS/CPmXR926PDTo7SOBemmaZtHE8g
	bL4WlwCobrY0ACSMLNZeUkj3NQ==
X-Google-Smtp-Source: AGRyM1v6ECH8DolGJTGZAMrGuB6MutvHtE6E/y7iHHFanSZqIcdESQaJ1Av1+9ir3yDaNGXwjrHh/A==
X-Received: by 2002:a05:6512:22c8:b0:488:e69b:9311 with SMTP id g8-20020a05651222c800b00488e69b9311mr7492057lfu.564.1658917790652;
        Wed, 27 Jul 2022 03:29:50 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id q12-20020a0565123a8c00b0048a854462a4sm2119726lfu.214.2022.07.27.03.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 03:29:50 -0700 (PDT)
Message-ID: <a8c778db-f52c-45cb-c671-556b24f3cb46@linaro.org>
Date: Wed, 27 Jul 2022 12:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH net-next] dt-bindings: net: dsa: mediatek,mt7530:
 completely rework binding
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Frank Wunderlich
 <frank-w@public-files.de>, Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Sander Vanheule <sander@svanheule.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Daniel Golle <daniel@makrotopia.org>, erkin.bozoglu@xeront.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220726122406.31043-1-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726122406.31043-1-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_032952_404991_2CF0EC09 
X-CRM114-Status: UNSURE (   7.18  )
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

On 26/07/2022 14:24, Arınç ÜNAL wrote:
> Completely rework the binding for MediaTek MT7530 and MT7531 switches.

Rules are the same for schema as for driver - one patch, one thing. You
mix here trivial style changes (removal of quotes) with functional stuff.

Patch is unreviewable, so it must be split.


Best regards,
Krzysztof

