Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9505DC4743C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 12:45:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F28F6100B
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 12:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F28F6100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FRi9s81/PE3coV3eOGxC+jwNpgJ/H49/z6/860pVa0=; b=ktR2YsN0g01GnS
	IUismcffP1vqh6LUX+4Iw5TnTOcMntsrH8J/jTEhmVOAHkxz4LNj1u36pEWSdvU5h836WTw7y1tzB
	cUjZCbzM2ChL1M3K9Ymrpw77WHD8hxtzym9bZlddCXHX89EcUapquG2goTQndoFWDrPX75KnXjMPj
	h8otHs2X16EqOItBe9l+YO57J4bqrzzv3R7mpUG8KyPppG58aPGyDv7KVP/5lM03tuDF1LtNti2C8
	t2g0hWQAFv8mJsCrkhBX16QQjUF+WkmcRzJxcMXYjW86AsUBWB5ZW+RUIahty80Ca+NRJP2EEiV8b
	ENIEaU+TEspZh7SJFWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvJJ3-003VYn-VI; Mon, 21 Jun 2021 12:45:38 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvJJ0-003VXM-PO
 for linux-mediatek@lists.infradead.org; Mon, 21 Jun 2021 12:45:36 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 v11-20020a9d340b0000b0290455f7b8b1dcso4636317otb.7
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Jun 2021 05:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O21GciyTpaxqmDgMZPyp7BhBIp+OaBFdrCDg/nqizCw=;
 b=CjH/y8SaoMXF3byYcObLTv0osehq88mbaxDpOhZs0Wde7MnJHOtQUe+kCASuohN8oG
 aOWjfAalOynXbrGRj/MB2LUyVcX9vr8SKfNkA6vR5F8unfVTmTYZtR49cCle1lEV11Xh
 Ej0cE2eP1kq4/I+8RSOKISdSP+5LyhiOFPyq9/3gcbEJQF0JV7o3XkzEI0ZvlwqsSBjm
 1mTGYUNavnyfjgaO7A1ymewQLHi03NM0RPUjmuFWlioFGMBlH2hAjljmtBsJmO9pc7h4
 RtUtfdeApE98KZ6pE/LExb0eKC8qA2+ShDr0eTtERUy9CEZRTeXGdg2uczBqW8+RnCuu
 J33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O21GciyTpaxqmDgMZPyp7BhBIp+OaBFdrCDg/nqizCw=;
 b=LzdyhtuH04j9nme4Xc11ZUORFVl8lWmYqf5+7jbnACTz9XirP3XGxq17vqNdrdk3gJ
 sauAfafIu74Lb1OudBEyBAaiSUhWEVJ1FBvZG5uei4kgVs+pZV7SKscU2zypLjNN6RMB
 comfsHEVRlLkyqQk+eFYRFmWeOYhLTkQsJ+3QprrlH+w6jWvF7/JRZ3hSU/+JbFvnHqP
 rbMMDbkpZcJUlLZAg0nIWQt5U0nUjTjTR93AuSTvY40aF8l2sbp8wc3pQJDkNlPVdLoj
 fCdX9XEsvc9/zuxwqBPIe+Q23IBNCzHhJhkz1Fqc/QE+K8tpfKvzWRlmHCoRUIL5HpC9
 wl6w==
X-Gm-Message-State: AOAM532td1Rmig1QNxCgtGqXsNdbkVdQ5kHaURX8ewtIUxmSdiMOaOAp
 ieKm+WkmWFOYn6RF2UxV/zptdoxb+chHrXBhfOrzDA==
X-Google-Smtp-Source: ABdhPJzU6m6lFzkIY/6suaM+3/SBqnWkGz1uc7je6Xn6rX8rQ595uL4fIZD/BMSlOIOl3gn/FRim1zid6MPDXSS0vfQ=
X-Received: by 2002:a9d:4e7:: with SMTP id 94mr21273799otm.233.1624279532556; 
 Mon, 21 Jun 2021 05:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210620114756.31304-1-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20210620114756.31304-1-Kuan-Ying.Lee@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Mon, 21 Jun 2021 14:45:20 +0200
Message-ID: <CANpmjNP9n8-m4MhY6Cdnfx_SYLVtG8NJ7raMUR+3rBoNyyfs+Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] kasan: add memory corruption identification
 support for hw tag-based kasan
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-mediatek@lists.infradead.org, wsd_upstream <wsd_upstream@mediatek.com>, 
 chinwen.chang@mediatek.com, nicholas.tang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_054534_865734_30D5DB08 
X-CRM114-Status: GOOD (  13.16  )
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

On Sun, 20 Jun 2021 at 13:48, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:
>
> Add memory corruption identification for hardware tag-based KASAN mode.
>
> Changes since v3:
>  - Preserve Copyright from hw_tags.c/sw_tags.c and
>    report_sw_tags.c/report_hw_tags.c
>  - Make non-trivial change in kasan sw tag-based mode
>
> Changes since v2:
>  - Thanks for Marco's Suggestion
>  - Rename the CONFIG_KASAN_SW_TAGS_IDENTIFY
>  - Integrate tag-based kasan common part
>  - Rebase to latest linux-next
>
> Kuan-Ying Lee (3):
>   kasan: rename CONFIG_KASAN_SW_TAGS_IDENTIFY to
>     CONFIG_KASAN_TAGS_IDENTIFY
>   kasan: integrate the common part of two KASAN tag-based modes
>   kasan: add memory corruption identification support for hardware
>     tag-based mode

I think this looks fine, thank you for your efforts. How did you test
this? Did you run the lib/test_kasan module with both SW_TAGS and
HW_TAGS mode? I was about to run that before adding my Reviewed-by.

Andrey, Alex, if you have time, please have a quick look at the series.

Thanks,
-- Marco

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
