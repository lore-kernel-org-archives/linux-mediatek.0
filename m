Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D74C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 18:27:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B57207F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 18:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b0R1yWXZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="kueMV6F7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27B57207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6ML9jo3m6yKyOiqc1mG+1T33DUkDq+RB+RO8minkhcg=; b=b0R1yWXZQE8chcnUlSZY7ALbJ
	K/IxLOxMbJfx/OUHcTlu/euqdxgLA4LHmcm5rJVMYoA0iLhHYTOPiGyczG4VZQaisREgfXf2u3vCm
	kv3wayD3M+L0FZFebDTkaclrlr5p5zxwtZLIadDwTGPA67yoWHIDygdQYOlSJIw5YkO6Al2ykExEE
	lrJhDkC5JntciXaHhmmwemptmSMoO4i/QcrbxXqR6o1YD+A/GpE7eTDvosGKD5duouIqQT6JN7e5w
	y9QBVsMRtaId3IRt0yeFgQS4bqnzGkolz4cyJ9U+t1AJCEdxBrmhdDBjLWh6RT9fk6/yCTG+KzlYo
	VPAQR5nGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqhRx-00077P-Ot; Wed, 01 Jul 2020 18:27:13 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqhRu-00075x-Sl
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 18:27:11 +0000
Received: by mail-ed1-x544.google.com with SMTP id e22so20930042edq.8
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 11:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OG4wPTT0MmrDulPUOcAMjDpTxFn9+Ne6TG3MoSiqdqI=;
 b=kueMV6F7kixPK1r1LUmhosoUHdVoF26Nf7ilD50zWA0NpUVw2p9yB0VvFIkRe/MTtc
 91Xu9beFY4EHpT+wkm6Rf3FairVR3Ax2kAQon0LmoIDmczNj+HbtS5eTEZStT4jqB2js
 dQm6UUhYMhcNm6YfeIiWbP+SaALeAFyOb+DA7qWn0AR5SyN+87ut7KhZNq3KKd3y14f/
 CIPP7EhHSkxDxlRJHp4CIIeUz+56LGpAb9VTAJ0e2pFw0Pmx7tunsWd1JBt1SBdWRb9n
 cdxMSH7jDl+9lEbGa6XGaGGZUCnNedzKRgVZcs55lerfHPgFGrZMC2WFPInkX4+Nb7Iu
 zq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OG4wPTT0MmrDulPUOcAMjDpTxFn9+Ne6TG3MoSiqdqI=;
 b=WfsBYhNUta8gVjvEMOv/fS8ILc3aYrJZK0ErYh0EHEpbrgggs84ZSxGyWfDkP754s0
 RMuNvAqxOPNTExFRG/46Sw7/T2ke+k/Vs/aiqJlVaV/mf6SVeSlKhpPRQUDEADizovZM
 alSxoh57yuMh6YAuqN0p7HwBHusg9dc0LOrgmLcawFxdMM3FfU+lU+VkOGCKCmsCPecO
 kdGYi3QuEdxtKfGKJF8ih1/6x4zXEXAI8RB6QO0/qRrDCm31MKwV3gTFsbOzkW18i37v
 kliNbapJ5UMJ72QrfaxTlBavXXyFtR2HW509bnEGFEW8YrcGu5Uxx3m6wHn/UqVavQU+
 9+zg==
X-Gm-Message-State: AOAM532h50hQveg4sk7xcPVxkvcRNg9pJSdwdfCCV5wdMpeO93soA56N
 0eQXMYK32sQxjS5BE5yb4Ul+vKh8YDNm1FeaNTtpTQ==
X-Google-Smtp-Source: ABdhPJwhuYNT92qHEkOHTddUFOs9/EMZDO1PWPD6MclccZefmL+2QM2Zb42zJC3klECb9ZpeCORMlH1ZSHciYjL+BvU=
X-Received: by 2002:a50:c219:: with SMTP id n25mr30985162edf.306.1593628029348; 
 Wed, 01 Jul 2020 11:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200630164204.1.I2cc415fa5793b3e55acfd521ba8f0a71e79aa5f1@changeid>
 <20200701132606.GA2363542@kroah.com>
In-Reply-To: <20200701132606.GA2363542@kroah.com>
From: Daniel Winkler <danielwinkler@google.com>
Date: Wed, 1 Jul 2020 11:26:58 -0700
Message-ID: <CAP2xMbtvf1BcRLJqrdMwEtrxt-EeDvPtUSontfsRZT+FvNvJbQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "serial: 8250: Fix max baud limit in generic 8250
 port"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_142710_999739_15661F88 
X-CRM114-Status: GOOD (  11.56  )
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
Cc: chromeos-bluetooth-upstreaming
 <chromeos-bluetooth-upstreaming@chromium.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Aaron Sierra <asierra@xes-inc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello all,

Please forgive any omitted information, as this is my first
upstreaming experience. I am preparing a second patch that will
clarify the requested points. Thanks in advance!

Best regards,
Daniel Winkler


On Wed, Jul 1, 2020 at 6:26 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jun 30, 2020 at 04:42:11PM -0700, Daniel Winkler wrote:
> > This reverts commit 0eeaf62981ecc79e8395ca8caa1570eaf3a12257.
> >
> > The change regresses the QCA6174A-3 bluetooth chip, preventing
> > firmware from being properly loaded. We have verified that without
> > this patch, the chip works as intended.
> >
> > Signed-off-by: Daniel Winkler <danielwinkler@google.com>
>
> No cc: stable?  No Fixes: tag?
>
> {sigh}
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
