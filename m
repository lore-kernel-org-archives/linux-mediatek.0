Return-Path: <SRS0=BtH1=MQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB4BC4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Jul 2021 18:04:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A3E260E8B
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Jul 2021 18:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A3E260E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ysi7Ej4U0PYkM3GCzsjzxrSJuXHifhHnAbpFLv4bS8=; b=c9nbcnGUzKsfEE
	zJRc8S3PGRKv2zW9h/koTs2Z5FLEWbu2kTNTIGFH40Ttg/3LqyZGZ0F9Ku1uGcB0ba4ks0WU8nZBD
	i2GyDJ9UjZycFULS21zc4agfIZyK40J6B+fO8XWXItLID07KQNepdLnNSq3QYW1pOnIg47YignPNv
	zlf1dl4XClN45BXGy7/gQ5Q/VL8tLJ4/By9FJ9OYcPfC4bvX6UgeyBNPy4zxpqC1c1GoeKzYQjfgW
	N/oSviqvO8MMWwAhpAp8JjIeIx0LFsiUcLlcy/mg7RNkSz1Ip/IBb+JOA2pVBktSxUoPtCzLuvdM2
	N6ACqQ4kBudUWeDyWf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7M0h-007bbq-N3; Sat, 24 Jul 2021 18:04:27 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7M0f-007bad-CT; Sat, 24 Jul 2021 18:04:26 +0000
Received: by mail-qt1-x82b.google.com with SMTP id a19so4018964qtx.1;
 Sat, 24 Jul 2021 11:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ySjT+9vhA6LvbQeBz3snrx5GQAIqPB2FJPEofd/VFlc=;
 b=CpeZupTFKNWztEfPSidkKyHokcBAMt2Wi3fxZGNLVd9kQwfMEr8hmCzrpiZN8OajUR
 1+Xgsg4E676KQ74nsIIUiTPr4+Zw4V/ZN5RKuKdZ6K8oXET13wSGXe+qjA54BIHiMkKm
 sHm8dYljb49cClUOdGMEM0pvJj4lj4UDwxdJinCyQHxn9TCwvT70YBBHtQPFkZbobDu9
 WF6iQDBjKpudNhx11mX6Mo0MhxNMN6RVUnju9CLdigEgMEXAXweTi0zWlz3/Ykl66JXW
 N+vs6XUlGIKVitlY1Q7e8wm2R9Y2VsNVnlQKT0a5UqVO6HFYANzF8JobRi+jguYBiwJO
 y3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ySjT+9vhA6LvbQeBz3snrx5GQAIqPB2FJPEofd/VFlc=;
 b=Kng4cJ9ZOjprO/1g+hnneEBfZAoRP5KA/+mexVjX6dbyTqSh+4FuwKMFQFqsaXhQv1
 9EGk7oaWf/zuzL0E1ZqF+C37m7n31DjFgniA+f/6A7eRKW2HQmAg1twHp0eMEItuIPvJ
 iBQ14rWtsxtSrsDi/VvHHmyvJ8mNAvCkPWrByt2pVjN6ob58rVsjaGLOCinOssNl9y+U
 ky07S8DcLQZjooCArsnqji5Qa0ol+S66I0iMPjsVgJOLXYZfm9T+7JlSgGPuur3fWYg9
 mTJV4scqrFuh5EseYEk4oT5Zn9LxZ6fMlfJkx7g96dJvsaE7MX5LA/UE2GTkhG2euEKb
 v/Wg==
X-Gm-Message-State: AOAM533T8UMrvVWANCUq5qX9R18vyQf3jDJwzbYgzkVaeL1FPMM/WnV3
 9LdcCjo+JZT0LVcmNAOknh2PBBnw4QdMSNh7CdA=
X-Google-Smtp-Source: ABdhPJxMOQJzEBbdDPWv1NzazwoX7K1S3r0NWDDWZvXR+QrtOrw9xPXY6S+kNGfbhguYEAiamAOcEG/7A5ZLh49DO54=
X-Received: by 2002:ac8:1483:: with SMTP id l3mr8917231qtj.142.1627149861044; 
 Sat, 24 Jul 2021 11:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <1627100621-19225-1-git-send-email-chihhao.chen@mediatek.com>
 <s5h7dhgi1e2.wl-tiwai@suse.de>
In-Reply-To: <s5h7dhgi1e2.wl-tiwai@suse.de>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sat, 24 Jul 2021 15:04:13 +0000
Message-ID: <CAEsQvcs3P+TqQFzQetPfRycpo66eJFwnzwhk2JyCXFaCLFHmFg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
To: Takashi Iwai <tiwai@suse.de>
Cc: chihhao.chen@mediatek.com, alsa-devel@alsa-project.org, 
 wsd_upstream@mediatek.com, damien@zamaudio.com, tiwai@suse.com, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_110425_488920_CD882898 
X-CRM114-Status: GOOD (  10.67  )
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

On Sat, Jul 24, 2021 at 8:05 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> This looks like a regression introduced by the recent commit
> d2e8f641257d ("ALSA: usb-audio: Explicitly set up the clock
> selector"), which is a fix for certain devices.  Too bad that the
> behavior really depends on the device...

Dr. Iwai, perhaps we could restrict the generalized fix for the
Behringer UFX1604 / UFX1204 with some simple logic to devices that
only have *one* clock source.

In that case the clock selector must be set to the only clock source.

This way we keep the generalization without breaking devices with more
than one clock source.

Just an idea.

Thank you,
Geraldo Nascimento

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
