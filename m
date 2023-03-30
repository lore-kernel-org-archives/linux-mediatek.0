Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E40C761A6
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 13:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCALfOMUCA+7cbkFzE5ClFTbOlYcV+OCvi/3vd2QpzI=; b=RWetPNkk0gg/OWU1bmmh2zKSiB
	T9RzaOMuekvZwmvugdM6EaebVK9n+XE+sNmfVoVyDud4UBXR/YJzD9SjBUf6oQqdZsg+SfbHYaCca
	eROowggo4lCMl5PNkBCkbWzGqhok79FvW8f1+CWKbLjFNJh2LLRxuKo9/5Gs+Rrzy9lNMaReECqqF
	oBM/0KnXnon4vVyDdLaELAkcq1MXU9wBDi/msz0g3jsCZCp+ew/M6WX+e+RgFceDpHkn7ir93/2ep
	u1+xkeRc4D11i+V7KYfZwtxPohMBpmEQJ+1I8XXZjr495AIxl4glWEQ1EPAoTy+LUhT/4m5kHmL3d
	ycxWUHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phs2Y-003qJ2-06;
	Thu, 30 Mar 2023 13:10:06 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phs2U-003qFs-0U;
	Thu, 30 Mar 2023 13:10:03 +0000
Received: by mail-pl1-x62f.google.com with SMTP id le6so17987228plb.12;
        Thu, 30 Mar 2023 06:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680181798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WCALfOMUCA+7cbkFzE5ClFTbOlYcV+OCvi/3vd2QpzI=;
        b=q8EbuTS0Rvsdu2umDVcsX21gG7WlwBzQRSqG+glphuDbA68bBDGtsvmT3P4wfKGP/6
         ksI2QycwJ29BgXgpZszGd2yR0nsJiBoy7uSSOYvh85ySy/olqUxqsPlXQM4MEH0ETDj/
         Uw+uVa11ka9CvyYadaY/ppOZQYZTFMDLdAOO/4yfQZY4Lci9qlzLc7ZQUKcH8hD1kDq0
         eADo2mZ+huDKbIocDnksJPdZc3Kjj+S+j7v6iNX5qjWpz1lIj74uGkJ7fjiupJtogC0T
         szUgAORRQQJsjzinKN0/7PImycWiK1SPZlTDYgNbUpsEVOWW+wIMqJScJUQ5IMBbm+WY
         Vo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680181798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCALfOMUCA+7cbkFzE5ClFTbOlYcV+OCvi/3vd2QpzI=;
        b=PdrwQiiNtCYTqofBlh4aJVoScF5FpzTAa1ebx7KUKW/06T0zznTvvPRlX0XeWxYs/d
         HI8Ge/Wy6ewg+nt6zGYY6qEruuosHk9JcSWjWzJepNiGQ7ijDpuMcTrtNWpc+aYntjTS
         I2oROuaVuJqM4iVvns1BcHh2T6XKlNw64BwGx5lpQBx0QAkoRbOw5Gxye0v7gbtWdofu
         D1f3tLJWOfFtBnhOl+JsESFTse6luoSukpHiWe7JR4KSg5Bl/gDe6Sce7IuvwZMKXV8o
         6V8L5/2GmEFXsU+wFtXDD/KsBPLRbPUkYTMmtfYjuKCk2eDNn/qz5g1v4vt3Lm7kX1kD
         7bOg==
X-Gm-Message-State: AAQBX9ctVyYc1dXp2zCmGyLCgjs1dQUEeuKbO33UZCTWyqWAGu+n1NgM
	3bKafrtglBhGwHx809LL9EA=
X-Google-Smtp-Source: AKy350ZW/GFX58WiadMJbKuotQrVNunP5H2QYeW0YokOfcetmboxpxgezstrTiQ7wxDpKxZnD/BZWw==
X-Received: by 2002:a17:902:ce8e:b0:19e:2fb0:a5d9 with SMTP id f14-20020a170902ce8e00b0019e2fb0a5d9mr6584147plg.32.1680181798039;
        Thu, 30 Mar 2023 06:09:58 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id w22-20020a170902a71600b001992e74d055sm8707635plq.12.2023.03.30.06.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 06:09:57 -0700 (PDT)
Date: Thu, 30 Mar 2023 16:09:36 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Hans Schultz <netdev@kapio-technology.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Ido Schimmel <idosch@nvidia.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 net-next 2/6] net: dsa: propagate flags down towards
 drivers
Message-ID: <20230330130936.hxme34qrqwolvpsh@skbuf>
References: <20230327115206.jk5q5l753aoelwus@skbuf>
 <87355qb48h.fsf@kapio-technology.com>
 <20230327160009.bdswnalizdv2u77z@skbuf>
 <87pm8tooe1.fsf@kapio-technology.com>
 <20230327225933.plm5raegywbe7g2a@skbuf>
 <87ileljfwo.fsf@kapio-technology.com>
 <20230328114943.4mibmn2icutcio4m@skbuf>
 <87cz4slkx5.fsf@kapio-technology.com>
 <20230330124326.v5mqg7do25tz6izk@skbuf>
 <87wn2yxunb.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wn2yxunb.fsf@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_061002_217485_A7857739 
X-CRM114-Status: GOOD (  15.28  )
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

On Thu, Mar 30, 2023 at 02:59:04PM +0200, Hans Schultz wrote:
> On Thu, Mar 30, 2023 at 15:43, Vladimir Oltean <olteanv@gmail.com> wrote:
> > On Tue, Mar 28, 2023 at 09:45:26PM +0200, Hans Schultz wrote:
> >> So the solution would be to not let the DSA layer send the
> >> SWITCHDEV_FDB_OFFLOADED event in the case when the new dynamic flag is
> >> set?
> >
> > I have never said that.
> 
> No, I was just thinking of a solution based on your previous comment
> that dynamic fdb entries with the offloaded flag set should not be aged
> out by the bridge as they are now.

If you were a user of those other drivers, and you ran the command:
"bridge fdb add ... master dynamic"
would you be ok with the behavior: "I don't have dynamic FDB entries,
but here's a static one for you"?

