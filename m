Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED77BC761A6
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 15:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lU9JCkTye6Fj+qGS5BcJ6TDCunaP0ev1Z3VOnL6O7u8=; b=D2iTkjhjopk9Eu5aonacl9DNHN
	6Ba6QxgnHhVPa+p3N63Sj4/JAiMhqYpFNqyMfSfxvDrJMB1hS/umz6p3HpNYjsXc0OvuRLbZGxqQp
	3oyw4/EQi/SPJeNpWOmbJFcBzR4CcNMz1Cwt8hrXsMjzOtqvwPaT+59QHfswSoafhUJ0b1iYEx0qP
	iu9OBS43q/cNu1Kjy+nIzVVhwWIFLR6wtQlA6SzzfcT6JY0Dt30wto7NS7ItCG1hy1ZXqkN4JIDix
	Ddst3BI82nJoppgJXq3uR4pTE0X4eG7o5ha2MCNn+ljofvX41SF4/PIJWNKLBq7xgPRwXN/y5IKSu
	1v99WiYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phuSS-004MbA-2Q;
	Thu, 30 Mar 2023 15:45:00 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phuSL-004MWY-1Z;
	Thu, 30 Mar 2023 15:44:55 +0000
Received: by mail-pl1-x634.google.com with SMTP id w4so18433754plg.9;
        Thu, 30 Mar 2023 08:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680191092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lU9JCkTye6Fj+qGS5BcJ6TDCunaP0ev1Z3VOnL6O7u8=;
        b=ARXUEmqMaQiFvA623fC9h/1bTtbZu+9APT25M51Fyzal5QyyBhpNOKenjrxHC9tNvl
         S5qRlO9XoSCMeMsGUxdNgy5JziINi0lqiObnEMVskhrUlgY/Nx4DIG0QNEQsDohNNwVI
         ZjpV6n4C/vseZe/Yaal+huKNBxLZRFnxa87dsmJ+XNyIozRshatOv7uSBF+5zoQgGC9u
         APpkQ7cgiCA7P+a0ITBi0t+ePzbvRC6ZSQ8PNQFlEV5Nkz3BPNiKrW3feDlfatNMu8VV
         ylQbTLsNnGSA8P3WnQGfjLEZ3+xacpPhY8gzVJGbk7L8KERA9bNGO7XypeGYZuS4b7+c
         MaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680191092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lU9JCkTye6Fj+qGS5BcJ6TDCunaP0ev1Z3VOnL6O7u8=;
        b=vLdybZW2ke3ziRWXe3EYNZ0ISp6dFpR6iMihXGwQL/T+SexT7dIOKBcW8FCQiaRyif
         nNxvEmxrayG6nrfXsCtmPzTdQ5KA7641llxj/qU58sbOTzsija3gZayBywjubEz+NM65
         F2ZEarIwhkbpjSN4wk1t9bjk5eAsAg1o5pAoweiVLrIBFLddQZ5strWznwQ+2F1s1bgE
         l14ovgeaq3ARUNBx/o/Gha7mslEaf7OkwVAZtIleWR/7eNpcJoB8t6hne8udSkuKwyBp
         NGuhzRfsoA+rfh39MihMeY3RdG+AP3n10uwQ/d2x5FZSWkvMovtNpn0Q1E+wFdlTO7L8
         qobg==
X-Gm-Message-State: AAQBX9dmLsc/7VFgYWzS+m8URsGas4cETZpzRZeC346VrBygs7VKHLEQ
	h/8izcCb3uykgs0zK0ebzvw=
X-Google-Smtp-Source: AKy350an4aqBBaa4AoyKQMK/eGaMNqvVN6MWoVbuOKTA1coVugM8BSX93rzwnm0ye04pw2RvKavoAQ==
X-Received: by 2002:a17:903:244e:b0:1a1:bbcd:917e with SMTP id l14-20020a170903244e00b001a1bbcd917emr26930417pls.10.1680191091900;
        Thu, 30 Mar 2023 08:44:51 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id u1-20020a170902bf4100b001a1faeac240sm352484pls.186.2023.03.30.08.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 08:44:51 -0700 (PDT)
Date: Thu, 30 Mar 2023 18:44:31 +0300
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
Message-ID: <20230330154431.vii5llyqgiymievp@skbuf>
References: <20230327225933.plm5raegywbe7g2a@skbuf>
 <87ileljfwo.fsf@kapio-technology.com>
 <20230328114943.4mibmn2icutcio4m@skbuf>
 <87cz4slkx5.fsf@kapio-technology.com>
 <20230330124326.v5mqg7do25tz6izk@skbuf>
 <87wn2yxunb.fsf@kapio-technology.com>
 <20230330130936.hxme34qrqwolvpsh@skbuf>
 <875yaimgro.fsf@kapio-technology.com>
 <20230330150752.gdquw5kudtrqgzyz@skbuf>
 <877cuy6ynf.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877cuy6ynf.fsf@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_084453_526953_09332224 
X-CRM114-Status: GOOD (  13.64  )
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

On Thu, Mar 30, 2023 at 05:34:44PM +0200, Hans Schultz wrote:
> On Thu, Mar 30, 2023 at 18:07, Vladimir Oltean <olteanv@gmail.com> wrote:
> >
> > Then, make DSA decide whether to handle the "added_by_user && !is_static"
> > combination or not, based on the presence of the DSA_FDB_FLAG_DYNAMIC
> > flag, which will be set in ds->supported_fdb_flags only for the mv88e6xxx
> > driver.
> 
> Okay, so this will require a new function in the DSA layer that sets
> which flags are supported and that the driver will call on
> initialization.
> 
> Where (in the DSA layer) should such a function be placed and what
> should it be called?

Don't overthink it, no new function. It's okay to just set
ds->supported_fdb_flags = DSA_FDB_FLAG_DYNAMIC in
mv88e6xxx_register_switch(), near the place where it currently sets
ds->num_lag_ids. Either before dsa_register_switch(), or within the
ds->ops->setup(). Both are fine, since the user network interfaces
haven't been allocated just yet by dsa_slave_create() and so, the
switchdev code path is inaccessible.

Existing drivers will have ds->supported_fdb_flags = 0 by default, since
they allocate the struct dsa_switch with kzalloc(), and DSA will have to
do something sane with that.

