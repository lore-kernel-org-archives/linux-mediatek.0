Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059FEC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 05:10:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C00A76152B
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 05:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C00A76152B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OiKF6/2lY8z6+6Wv6Lt0C0j5qd2kkJUm8JIqxf0tBo0=; b=nWMy9Gp9X5St/9
	DX8cbcjKAaclXHzovzdOqNJwjhGQTEYfVKyGM/l/Y3iTucMjF9SdkPiaeIhyKp3XiKH3l2QwU92xz
	Vrp7CBNOdYZ5gil8siuIJ/V1Kwt7OfNrYjPNeXzV+L7YRQGqZdV98G9IyNwegTd+fp0JWfcKzC/bh
	FEVhbuA6gGfg1yCSvIap9VuGJ/ICx+Nysl3PlLn2Es9GwrpbD76uiaUCK2lzfWya7vxzxIOKrh5MK
	J8nDKhHRfuRlb3oflbAHCcJ7mVxURP/7KHgo0R18bZo3psx/C6IUEnt4cghcA2tob6RT1bFc6DKPm
	WyjRhavxm/9RdBjnSqdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnDCi-003Ku2-FE; Wed, 17 Nov 2021 05:09:52 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnDCV-003KrH-Lw
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 05:09:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id o29so992304wms.2
 for <linux-mediatek@lists.infradead.org>; Tue, 16 Nov 2021 21:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lrvdcWcxvEwbfdmc2m1Y3TPgWmvCSYywuOybBoGaU3U=;
 b=Y65X+0FMlEkzchyhA4oXbgQkYAWp0F/+pq5j4hMXmfGYkJfOTRGsMSvoBJJlaA1DV2
 FoTf6rYPUE1l33dJeVWp1wCoskIxtp79FrzcL9QtZa7FBWraJiOjfxk5vk5lH6hDDAUR
 Ypynsx68SR17nzwYh1jY7/ClHapN34PNHSMRiFg8Yodzgn1f7mk5IhgxweGwXPmzoODK
 rZRXPKBmxmMqMDjC6zxwqNjmfozCWOhGozM08elbqx8KvjAtdpDre/J8Fldg9dDx9CC8
 P1+2JJMjzUZQWbKnWM53AzJb4SoX/5g7lymwgxi/fUmlqW0SknsJMgIXwlVUSXLDs7Ny
 awwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lrvdcWcxvEwbfdmc2m1Y3TPgWmvCSYywuOybBoGaU3U=;
 b=AWyc0yrLtPfWJF0jyJYiGJmBeMtMC4hwe6E4e3USYkJDACgea522ni3rvMLHMtRWfp
 /JOoPkCd3EBYTDd1Nl2O9NzDDMar7xT0PfH/3u5SPThr509lyHg28eHwu+e+HJzfJ9DL
 jPL4QgpeiKBN6bD5Kq/w1x4RzbBxsRHg1SbrZVcKlfI9tjCSsQNXuFYMtw/yFGaIM7Yf
 ++4L9ZleYtmJ/B3t0iEN990P5PdXjQyRNfwSB4WIH7PbvFq2ytH7A45FCnHPLuJRZx+e
 ENsJ4J20E+kaHvbGcJt5yHlPuhDkyGlZhJRRK3LIa1qKyIeh2WXU34HHHhdq/375HyLf
 M44Q==
X-Gm-Message-State: AOAM530vMpPsZF1jeyqdcl36Ju1DZXTCbKR1q8UfekCZGqAKq2c0sV4O
 nXnaMOCh12Pk23AVijz59WHIZQUHsuHkcfs996Ks7A==
X-Google-Smtp-Source: ABdhPJzPp8kyoz0IhAXb+yjfPOmdnmuIHhJtx6aV70+6f/J/bE01TbukDk/KFJ+68UXnZSRQoM7MSzceQfbJ5ixoHM8=
X-Received: by 2002:a05:600c:1549:: with SMTP id
 f9mr14514413wmg.118.1637125774601; 
 Tue, 16 Nov 2021 21:09:34 -0800 (PST)
MIME-Version: 1.0
References: <20211116060959.32746-1-rocco.yue@mediatek.com>
In-Reply-To: <20211116060959.32746-1-rocco.yue@mediatek.com>
From: Lorenzo Colitti <lorenzo@google.com>
Date: Wed, 17 Nov 2021 14:09:22 +0900
Message-ID: <CAKD1Yr02W-WuLx8ouvP+wTtkxeyTBW_dp1deo9sim7wfLA2LXQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] ipv6: don't generate link-local addr in
 random or privacy mode
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, 
 David Ahern <dsahern@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, rocco.yue@gmail.com, 
 chao.song@mediatek.com, yanjie.jiang@mediatek.com, kuohong.wang@mediatek.com, 
 Zhuoliang.Zhang@mediatek.com, maze@google.com, markzzzsmith@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_210939_746342_6E613243 
X-CRM114-Status: GOOD (  16.15  )
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

On Tue, Nov 16, 2021 at 3:15 PM Rocco Yue <rocco.yue@mediatek.com> wrote:
>
> In the 3GPP TS 29.061, here is a description as follows:
> "In order to avoid any conflict between the link-local address
> of the MS and that of the GGSN, the Interface-Identifier used by
> the MS to build its link-local address shall be assigned by the
> GGSN.
> [...]
> 1) IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA, this mode is suitable
> for cellular networks that support RFC7217. In this mode, the
> kernel doesn't generate a link-local address for the cellular
> NIC, and generates an ipv6 stable privacy global address after
> receiving the RA message.


It sounds like this would violate RFC 4291 section 2.1 which says "All
interfaces are required to have at least one Link-Local unicast
address. It is also not what 3GPP requires. 3GPP *does* require a
link-local address. It just requires that that the bottom 64 bits of
that link-local address be assigned by the network, not randomly.

Given that the kernel already supports tokenized interface addresses,
a better option here would be to add new addrgen modes where the
link-local address is formed from the interface token (idev->token),
and the other addresses are formed randomly or via RFC7217. These
modes could be called IN6_ADDR_GEN_MODE_RANDOM_LL_TOKEN and
IN6_ADDR_GEN_MODE_STABLE_PRIVACY_LL_TOKEN. When setting up the
interface, userspace could set disable_ipv6 to 1, then set the
interface token and the address generation mode via RTM_SETLINK, then
set disable_ipv6 to 0 to start autoconf. The kernel would then form
the link-local address via the token (which comes from the network),
and then set the global addresses either randomly or via RFC 7217.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
