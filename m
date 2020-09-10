Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E47C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 10:50:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB2C0207EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 10:50:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d0R0uQO3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="MfR+kaqr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB2C0207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8GsLAvMKok67agvXkcxqEJp3yZJuaSTrG90Ytuao4TU=; b=d0R0uQO3gh7VVlWkuw4AV69bH
	AUV7i2SHmSdCmt8bYt82ABk89EVvjAGZFfD577pCS9fSx4t9dygtGD6roTMjxC/DSHoACUMepNRWZ
	ve1rvbPrhYeW2Q/Zrwt8AgiXpSnU0JLc6fI5djh+JkpdWQespXPApz/UVibPzm+EFcMLuywnnBoGr
	hUgeVPc2gxFXDlBXsNNYzR7RGy3ON1TiRbU6n8Mwk4g2OSJy5q7GUJ6OGdMHTRWsBKKrmXONE6knk
	lzjgvV2yonpGi4S19ecsTjN620VrphRT62wCNOYbwMx7xlpMUq8R+R0HEQgxC/3pnh7FmuJwXdPak
	TCUg89tEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGK9k-0006bM-2H; Thu, 10 Sep 2020 10:50:20 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGK9h-0006aP-6f
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 10:50:17 +0000
Received: by mail-ej1-x643.google.com with SMTP id p9so8019103ejf.6
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2020 03:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dl+Puul4vVPh8oSiqSBQlazGVFYUlaK2t3JkMD3S8VU=;
 b=MfR+kaqr9Ijvrx9g8wnfe7FFqLLww8qX3LZ9b84v4pCfAz/g6fGA42sPm0CJpfWGGE
 qYE7rUatAHQDiitWJVs+uVxotoSAZqt3zr7GoxqZGh1X3QFe7FU352wH11BltiJNbHql
 5AEqFDggtRG3ieScrHb1PF00WL7dA2G8E61ESpi3lxr5RGIVR5IxhnyQQ0zgnrTAX3WJ
 VCZedtySvxPz/rXfJbYgpG31Vva3nJGgcQW74ksuK5HiDq8OoQimF9YEDA7bng/B1Prl
 fHM3laMutRyVCPg1OtxDzcu3uQx4vqauE5jF35lEQWUua+8X9EvtaD00ZrmplRoQ5jGi
 HkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dl+Puul4vVPh8oSiqSBQlazGVFYUlaK2t3JkMD3S8VU=;
 b=l9fXYR3zzbKUhtWuf+OTpT5KZkk4JmcySyn4yv59kAGpZXqVuXRW1nNhr3VjLKbhsT
 hlyVWxdewLd0EygxW/k6dukXdwm5tUqBAC5zRkwP2y59DJQBIiPfhWWtuKSrR086DefC
 1R/CzDGVy9NHLYtHud8o7LsuhYoGbUD9MNWaodldcGh/ZU1cUQhARLoVBSbW0XFR0xE8
 h6SFePeb4ZzFfZlSJWLEB4/9aVCdFjCuMvcKcWUB69WuJ76QN/7lozfT7bwl0w1HxJPH
 D8C/DMHtML0POWpJVoIkeDldfj3W599VSys/a+mCCn2VU3TN4Wa/HhZnRv6quccy9Mmy
 GSoQ==
X-Gm-Message-State: AOAM532SYzsAEiCR7uFM9cA5UoLrs7UVwb9GPJQ6PGeFlhSZwviCYuxu
 BB+axlWC6maUX0EV+2kkXEyHrz2rWQD58qQrzlFsyQ==
X-Google-Smtp-Source: ABdhPJz2QEjAlqXQ/OoQNuvXwR82jdCqI8EOUurylTRWYYiFSskudC59oTiUg29MEX2zzBztMwvKMOU5vvzGeJ0jq6k=
X-Received: by 2002:a17:907:94cf:: with SMTP id
 dn15mr8438636ejc.114.1599735004965; 
 Thu, 10 Sep 2020 03:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 10 Sep 2020 12:49:38 +0200
Message-ID: <CAG48ez1jLVcj=BAAsSA5i-k+gCtRNn+OhfwAWAxFJSKLwZKQ=A@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 01/11] usb: early: convert to
 readl_poll_timeout_atomic()
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_065017_271391_C1B487E8 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Mathias Nyman <mathias.nyman@intel.com>,
 Sumit Garg <sumit.garg@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Yan <yanaijie@huawei.com>, Chuhong Yuan <hslester96@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-mediatek@lists.infradead.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 kernel list <linux-kernel@vger.kernel.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2020 at 10:24 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> Use readl_poll_timeout_atomic() to simplify code
>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: Jann Horn <jannh@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
