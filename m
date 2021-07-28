Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E75C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 04:19:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D29A860724
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 04:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D29A860724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/o+6Qma+J2SdBkLuThRuFedXupqfSWbN4GCehcovUo0=; b=A+utH6fCQVZqUL
	hlNMUlCX619Za0ReMnkYffdNCGdzIRbBWq4P5fWC2ROfv/Wzo6XN43czRyMAYoqVQ3PetCS3/GVYW
	HI8ebPu6Hc2B+W5Z0wXtiDvc39HYh9bc8fuVX/NyodWqvo2R630qavmwRZ54CaFOWw19vEGSFs3Y+
	0xN0fMkGY/45ylUph4Md9jlqU9gy2swBFWAPnADak4Hnhet6KoakNF59Ws8NAFs2jElvBDOQgkelK
	dgYI6VeRgp3/SUoO5GGPa02AlEPJgY2vFFPs9vwaxAsMr5wf6YnBHk1CjiidM3dFAQb5vy+/TCZSJ
	SmrbrhQcW/rRjx9EajqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8b2g-00H3Tk-JW; Wed, 28 Jul 2021 04:19:38 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8b2Q-00H3Rt-U9; Wed, 28 Jul 2021 04:19:24 +0000
Received: by mail-qt1-x832.google.com with SMTP id h10so478509qth.5;
 Tue, 27 Jul 2021 21:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=98gtSXDc7ZlTP8DOpD7xPPrbBz6KU/i+LtjlbzvHQbE=;
 b=k0X6UEjkKBfbAFH6JYFJNMOfoQuDUk6MYWgifJN2pAnWZnEeGST5bE74ezH/a4Ew8m
 l7+Ha5ZJzvssBw6MkI6+vJItvzys74w8MoJNkyeBcDGKwsmKCY+QW8vmmd26oCSfTTJt
 AaJvOxs7IhcR+nfQJONeDTeW+x1tB+jLz2umb27g8Lv5R7R5wa2TySBJWuj/TmkwXGRP
 VpIhPpKFi4ws1+9QWtJ/4237wxnTJbmRpT4wolmwZclF9yYVJCqyIiY82cByYOx34VNl
 OUYMFTOTln5FSaElAUSKa/6uujrTsBgBpsPW2W6CWfScvptbn1fhKlsAOsHNe0Di95/I
 aVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=98gtSXDc7ZlTP8DOpD7xPPrbBz6KU/i+LtjlbzvHQbE=;
 b=HkwFVC2n1oUG5s66SimxBRP/6mjNOwCPADJco4oyvP0DjtP4L79es+YTvTTbNDySGi
 VjtlkNowMzslmgUMr0W+UqmhV6lWLLnhRpCp7qEDIgVvpNQcMYgZcavYax9My7SWoGyz
 +ZQL74BXcBihyWVq8rc28tQvLARUj0iVhNYOoFWUrG6fPbUfaQqY9nvuA1rDZrq8GGNk
 dwCSOO3rdaE1qXuACEUr05p7+KvKvu9+0XmBNMHqELhMcWOx5aRhwTuMV06qr7gWEmYV
 5LW3kecSO3dVpnJnKsNqPHdXyL3Eo1oFAKNO1Yb6tyYloEWWKTj514BFl6KmAfDL/wxq
 /r1g==
X-Gm-Message-State: AOAM531UbMAjjdnxzXG1s2UHqlPGM27S7fAyG5e2kJCh6jY7YdQZR8j6
 xYuZt+IFL5TSHM3uIscRqqtGMSvZaAG4oe4BOGY=
X-Google-Smtp-Source: ABdhPJzpRxaeYMeDLeO8zgqFYNb5J+g+FY8Gr9FLuWekwpckk/L7lwKzlbgsAza9R5n6NqJdrQnj4LbbOWpJUBlWZXs=
X-Received: by 2002:ac8:7c54:: with SMTP id o20mr13378070qtv.142.1627445961649; 
 Tue, 27 Jul 2021 21:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvctJDnsaRTXAGAJ6==juKazoo2=AJrWabLzqE=jCfg5EEA@mail.gmail.com>
 <20210727102744.30364-1-chihhao.chen@mediatek.com>
 <CAEsQvcuOQ_Tg0bRbsegECdBUsGxa61ei9-Z2bRbGvQ9FmEUPbA@mail.gmail.com>
In-Reply-To: <CAEsQvcuOQ_Tg0bRbsegECdBUsGxa61ei9-Z2bRbGvQ9FmEUPbA@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Wed, 28 Jul 2021 01:19:13 +0000
Message-ID: <CAEsQvcvMVCptNss0iSB1uk1vu7PNdyO5c3jzHbi3HvRELi5Jdw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
To: chihhao chen <chihhao.chen@mediatek.com>
Cc: alsa-devel@alsa-project.org, damien@zamaudio.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, tiwai@suse.com, 
 Takashi Iwai <tiwai@suse.de>, wsd_upstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_211923_033500_0EB90B65 
X-CRM114-Status: GOOD (  12.50  )
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

> Chihhao, please try the below patch and perform another echo test.
>
> Let us know if the echo test works or if it still fails and please
> remember to share with us the relevant dmesg logs.
>

Chihhao Chen,

when I said echo test I meant just test the device and observe if
there are noises related to incorrect clock setting.


I then realized a bit too late that probably in your programming
culture "echo test" refers to the whole technique you used to hook the
kernel and debug the issue to produce the fix.

If you call that technique "echo test" I'm sorry, I didn't know it was
called that way.


I just meant to briefly test to hear if there is noise even when the
clock parameters are correctly hardcoded.

My intent with that patch is to try to prove there's a firmware bug in
action just like Takashi Iwai suggested.


My apologies,
Geraldo Nascimento

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
