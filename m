Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5155C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 07:32:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6516207DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 07:32:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CEXQ2hzf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="tNKStXXB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6516207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ybj0TZ8j3GlIUiD7NzClH5ezWmOMO86TGjjV1QFUzPk=; b=CEXQ2hzfe7JlY1CgV1TqlT19E
	1PS1vQ8zXqO33FotdwZKxSHa8g4F6Z6HE8kPUF8+VY4v+CAJqNzgHFucX2A84sHC3asC6FsrRASkL
	pk+jwBGVdOLzSe1linqfYfmxkbbJHBNsD3X1du/IY0zfXPSxc3Qq39qKFkgXfGtYbAdkwBuq2CWAb
	IPPPiQc5Of1AQi/6Rfst/X14fr2qGtK6zJJxnfNH6eAA+If5frThurPaDsBdpLFsfBrbDUDi1HSTZ
	JK0WJfPRtWz26alEzZMt9DEST029XVbjR2KSo3dCJ+u796JmMpfSEGNtkbUD9M63CC3ZCp6crlLsS
	3S7iTz9Ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7ZdB-0003Az-Kh; Mon, 17 Aug 2020 07:32:33 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7Zd7-00038a-3K
 for linux-mediatek@lists.infradead.org; Mon, 17 Aug 2020 07:32:29 +0000
Received: by mail-io1-xd43.google.com with SMTP id h4so16678727ioe.5
 for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2020 00:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=coRFPJbKc7ywpJ/3lZow7TORgJ25yZLIlsHXIN7jxzI=;
 b=tNKStXXBprrwJHyJVh8NMGU+XD/0G/4WKH47mbhpwKE5Z6rUlmgshyAEzqbJncPpcU
 rcC87eSlhXpk+Z2a5TSf8ZcQXN8a5uCph2e7RrhB7fIE4V83bm7yahnQ+xyeUVvrUyM4
 lykuFoQpx6RtkQKUW664Zfrx9e63X4S5cxa2kRaMjc4MNWWTPc5c9qOBg7tW+qCx0PNI
 IUkErl6rHI/4UhdfAst2zcAWE4GiNkjw+V40iQLu44pN5lNZQIZ7Atzk9qYEMmkEwl2b
 y9OiDJtGUpzZM6gjZyfua6XC2nvhby0JbCsJx8qg1u/l9qnWHZmPZ5+fjbgsz9E1LTuC
 lgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=coRFPJbKc7ywpJ/3lZow7TORgJ25yZLIlsHXIN7jxzI=;
 b=Fcq3e963U2EpdQvUPrM6vCJkJaL7D6Bvjip8MeecDbc7M4daKKnHkIw4vCgnF5eEVV
 pRbsyWJW3laXeBgNaKymuenWVZlEnHXINiIx08CAlTZ8u2UTmvpBWm5GR0ebCEYJGw7j
 Onsk/lBF0KhBUZWo+9er+mAUV+URsKjL41ZaRrWPPPswhHeMM6Q3dbGQhsOaYCSfhTzO
 pMRSysWM2XxvDQ3X+3+HLraweZTuE+OQMudFnVU3wDFqZr9RBej4Xi7E8R+oO0r++7Vx
 qO3rCkXrIQ7PIRxGwRCO1U+z3r6GYO9A3mt/c3XiOG/qCR4y6xkGSgnEYZck3MxGco4F
 OnZQ==
X-Gm-Message-State: AOAM5333H3N++ztn01pkbFPQEsRLih6gB2ljE66HBErloOuv3eA6dMF2
 YW3DscU1MeY8mNULUpu+esX+HYSBl6c0o5Sl6giSug==
X-Google-Smtp-Source: ABdhPJyiQfEySyRQED1xZDsTrTIji8ZHp7mV/pCtyczHBll+qmrXXvVx94yMgeUGA+HSb+ucUVNCLkMo9+g8Mg+yu04=
X-Received: by 2002:a5d:8cce:: with SMTP id k14mr11326563iot.13.1597649547058; 
 Mon, 17 Aug 2020 00:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <1597644455-8216-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597644455-8216-2-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1597644455-8216-2-git-send-email-jiaxin.yu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Aug 2020 15:32:15 +0800
Message-ID: <CA+Px+wVFKNLYhYpchR-zmNkxaj2_fVYM_xUt7w73pp+KcNkR3A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] ASoC: mediatek: mt6359: add codec driver
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_033229_203326_47826C55 
X-CRM114-Status: UNSURE (   9.62  )
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
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, bicycle.tsai@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 17, 2020 at 2:08 PM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
>
> Add the mt6359 codec driver.
>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

LGTM, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
