Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CFEC47092
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 00:38:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6243613C0
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 00:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6243613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/2LpGtoTrJ8yTaHjCcx+tktOOSEndUCidSifLX/yUJU=; b=NB0NkljOaqzAYvSZpqhbbmb7xa
	zN5sjalHAPKD1GXlLp1XLGaeryxeRGiYjzRYJmYlRivwtWTsFsYxb26vwJLwRm6cW4l+PTi4iRgVv
	RDbdA0E2Ceqd0oC4xj2u74ZELlq1kXTkTsk39AvCaX3aNc7/2wR4fZoKF0V0OQgNalkvlCDNYHYET
	KpKh1/c8PDglCllAqrxKcK+CV4A/lDPnL46/VUcW8wYmWpKdh7eNv2u5NAGp8ajHIVbusnON57eOU
	U06m7ReJDZoU0ZH2OsAsE37qj18jUFF4i8P5ovXF8EYlRePGbNpH/6eBAnaMdUA9OOA+iFN8SSMqv
	7sI0BHtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loEty-001Mkh-SG; Wed, 02 Jun 2021 00:38:30 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loEtv-001MkG-T7; Wed, 02 Jun 2021 00:38:29 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 l19-20020a0568301553b02903beaa8d961aso1056096otp.0; 
 Tue, 01 Jun 2021 17:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5bf4YzypzuLYRxXllTngjIxMycW0hM5btc0BbcP4pGQ=;
 b=EpUeOPldVcaG6JyVgTky4Lswy3xM0/LQ+apM+dqJwFBqrnPSX0P5RSeFPeIXNJGBQI
 EI6B1dpBjdeNUAD/sb1uatmRduombvSTGzGdwtrNOImPpJmLynGSFFAwy3ZzWUll7HkC
 YXeDFOIsWEEzt+q1eoaXhRSjpvG+ePrSxJ9p8IqHY/R+esqd2m96ajobsAlUuuwdalgz
 P3V7NNoTfJpW/DtruOUo95DodZiKfq4qUbSh4zF/l9kdsLjiacJYVhmnORyzq5aSWv8O
 F0ZGQbmS+MuTtpRLlxpo4lStiuQ+6lr1xRBzSlSU8KwPEka6CeUZlyh3G40xPuAZalCj
 /k/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5bf4YzypzuLYRxXllTngjIxMycW0hM5btc0BbcP4pGQ=;
 b=Zknd6w/uKa8Ii7nvsjINInMJPbkmpRXTKX+BsfdtRRbknAqU2tIP9pzqXH4azpvM8x
 sZOH2EW8jxYQsLnV72UE2VhQGLaQUBrnTdf3wpvWoTSBjCD1sofH63HFjmBob1wFvB6q
 Xjhg+QT2x0PsvD+Bpm2PcTQ2eJIm516HvA5aDV53NRhLoTHYfLsdpIjQ3MAC7DtVv0Za
 eBD6Z2DkA3Cv4gzl27oAhplwQePEbf1iCsWMtL1va3kloozWwBBUCIYGxkCRxIeNRRCT
 0lLg2xlKPvrEdSfJqfh0Ky3JFE/rZcP1SiKRhOd5c8t/Pt+GKlY2dlWoQ5ZTWUdZZ/Gf
 LY/A==
X-Gm-Message-State: AOAM532whAnNY1rnHaOTVjXLRVabuF7sdiNqTcNr9dSaXNtrxKzcUrn+
 etdffbvJ/GALRnIQxdrsIxU+FUWKhoM=
X-Google-Smtp-Source: ABdhPJzJiWvLC/ae7Gp5Fc6qFYk/xLmDP/aKqAySyNqBoLY+ltYsC4P4mi18p87bVFFitpB+zf0zUQ==
X-Received: by 2002:a9d:554b:: with SMTP id h11mr23553952oti.4.1622594306582; 
 Tue, 01 Jun 2021 17:38:26 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.22])
 by smtp.googlemail.com with ESMTPSA id p25sm614586ood.4.2021.06.01.17.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 17:38:26 -0700 (PDT)
Subject: Re: [PATCH] ipv6: create ra_mtu proc file to only record mtu in RA
To: Rocco Yue <rocco.yue@mediatek.com>, "David S . Miller"
 <davem@davemloft.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, rocco.yue@gmail.com
References: <20210601091619.19372-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <7087f518-f86e-58fb-6f32-a7cda77fb065@gmail.com>
Date: Tue, 1 Jun 2021 18:38:24 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210601091619.19372-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_173827_976945_F0855E40 
X-CRM114-Status: GOOD (  13.84  )
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

On 6/1/21 3:16 AM, Rocco Yue wrote:
> For this patch set, if RA message carries the mtu option,
> "proc/sys/net/ipv6/conf/<iface>/ra_mtu" will be updated to the
> mtu value carried in the last RA message received, and ra_mtu
> is an independent proc file, which is not affected by the update
> of interface mtu value.

I am not a fan of more /proc/sys files.

You are adding it to devconf which is good. You can add another link
attribute, e.g., IFLA_RA_MTU, and have it returned on link queries.

Make sure the attribute can not be sent in a NEWLINK or SETLINK request;
it should be read-only for GETLINK.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
