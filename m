Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E14DEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3oBJWNqRS4GYOzJbLpSVjcydGhjP5A7dOEDm0w/+XA=; b=AOW2f8UuoVcCvCQpipa5taMqvG
	mk2peqcHjH9iAtgHjW+gFqzr57mcPWXhIMMl29ejsRQ56jf7SI0i7YyX925Fj73Fr4a4miPRInYOI
	V2H3OqP8yjmDJJMeZKVencrgg6qJ2j3/oOic6W9Tke/sCv3Vq+X2NSkBNYjiPdtEzCFxhnDn9PQL+
	Lk4KDSlMoV6aYx6UaEwdlqHFfaeWFdz5z6tM6l9LxKH3bVZAHveI7pDpVTYTGk5Rp/s5+Q39XP3SY
	ksjHn085MfbYeS+w8bizYxogSCdIQ33hWYVt5fHVDVknxsjCSZzjCLM7jhPlU92/zLAmaRadY7Mg2
	vlwkkiiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Bd-005Tak-2S;
	Wed, 19 Jul 2023 05:57:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0BY-005TVj-25;
	Wed, 19 Jul 2023 05:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M3oBJWNqRS4GYOzJbLpSVjcydGhjP5A7dOEDm0w/+XA=; b=WDpZwkM9FYmdZzessbAEy/MrzS
	BuQDZmsiard5hPa27zb5YntuFwi81ajd9k/3tVXu3o1OUoJzSp5TrRf3PZ5/bssTsXZOad32miyqV
	YxV+uvd4wYh9utPJ5bEeKnWtkBXRhy7ilS0eGlBFsSA+c1bOnUfUxpht1L2y4RVpMQz4fYfO4T1Yq
	Lit3XvKBKMR0MMaY+wWuQz1MerdXPgHKom7QD0LbH1y0AKkFXo3yMJwVQqlTA0l997iGL38UCvU7f
	C8eIPvO9sWrQHfWHyO//7acxSm6nM1p81FNvnclvD7OtCKISJGD22GldAZZEur3duxNgAEeD8BTfM
	flC8Qpmw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLltx-00BdzL-2i;
	Tue, 18 Jul 2023 14:42:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 498C1615FE;
	Tue, 18 Jul 2023 14:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E631C433C9;
	Tue, 18 Jul 2023 14:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689691286;
	bh=D8T7AaoTVgJ/zF9HYinCPbZygZRrtcxqIDjje7WsbPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mvR1udQqBCeJaUWDPCUNu5/EQd8aCFy0+W815lq/pHJcK82HzV2EFuJLA+UN4fDRP
	 MzCuUBkTOIACMSKbH19mHv2onbLm20hAUhwvPZPWAuy6iIqFfD3kqgXuRLMWzUXj2Z
	 a1OztjizlYDwMkjZT91+65ZEVB4WRt9mXRvrYn90=
Date: Tue, 18 Jul 2023 16:41:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
	corbet@lwn.net, agross@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, keescook@chromium.org, tony.luck@intel.com,
	gpiccoli@igalia.com, catalin.marinas@arm.com, will@kernel.org,
	andy.shevchenko@gmail.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH v4 00/21] Add Qualcomm Minidump kernel driver related
 support
Message-ID: <2023071844-promptly-swimwear-f6f9@gregkh>
References: <1687955688-20809-1-git-send-email-quic_mojha@quicinc.com>
 <2023062814-chance-flounder-f002@gregkh>
 <CAL_JsqLO9yey2-4FcWsaGxijiS6hGL0SH9VoMuiyei-u9=Cv=w@mail.gmail.com>
 <CACRpkda3CJ7G4-wDPkWmzg6nyCoEfG+u2cQH6KXWNjbftd90ow@mail.gmail.com>
 <355de4c7-180d-4edd-b6fd-9c8e29e40e42@quicinc.com>
 <52650970-de78-764f-28e2-ee0115b7d5c6@quicinc.com>
 <e4784d1c-73da-9cda-6aef-d02625e8efd2@quicinc.com>
 <2023071833-clamshell-drinking-188c@gregkh>
 <c8064592-bfac-67b4-1d7e-e173355c43f8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8064592-bfac-67b4-1d7e-e173355c43f8@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_154210_138168_47141134 
X-CRM114-Status: GOOD (  12.05  )
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

On Tue, Jul 18, 2023 at 07:25:15PM +0530, Mukesh Ojha wrote:
> 
> 
> On 7/18/2023 7:05 PM, Greg KH wrote:
> > On Tue, Jul 18, 2023 at 11:17:12AM +0530, Mukesh Ojha wrote:
> > > + linux-samsung-soc@vger.kernel.org
> > > + linux-mediatek@lists.infradead.org
> > 
> > What does that do?
> 
> This is to seek their feedback, if they have something similar requirement
> to debug end user device crashes.

Feedback to what?  There is no context here and no content either at
all.

Just adding a mailing list to the top of a message doesn't actually send
the thread there.

confused,

greg k-h

