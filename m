Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9C2C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 11:49:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA75206BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 11:49:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gi2m5RIs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ifu4mAhc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA75206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lwgaBjJlzrt+tN/0GsDCnGqp7W58x+Z9E7YiE5aYhg0=; b=gi2m5RIsSbeDaSIyfq2F7rirk
	8bU6sL57K7xeNDY1gEHxVjaePvY2u39QpbWhGZ3aSbS/laPZHBcQF2nFbqcBuaePnW984TQtUvva8
	/bBn9Sk8BB4cEEZCzAkp031GdwIxulnpqWskYhj819fGDhIcPPMD/2BesJq2Ept4TyL649mnynnhT
	TTLnK4h8D4F6/niTik8b52XM/FFkNPTxBknMWo9J+qB2zdqdFN51AzMS9keH4y94J9XlOmBpxeZ5l
	4IGVLU6iMOXqYTfYd5rlqrp7xJUIqTWV/2b1pMwE+r9WuLOhajLz/xWyDOGuJqTt62LviJpbx1S17
	IoJtlWC1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAAyf-0003T6-Oi; Mon, 24 Aug 2020 11:49:29 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAAye-0003SD-3d
 for linux-mediatek@lists.infradead.org; Mon, 24 Aug 2020 11:49:28 +0000
Received: by mail-ot1-x344.google.com with SMTP id t7so7032628otp.0
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2020 04:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IfIxkLsRxova3XYkDm6i/K8H2HRLaB3EQ7huQjW3f6w=;
 b=ifu4mAhcTRgtT25z97rVnVLSZIehYoWZP8njiAuMAclckn9QF6jbVP9Hz7Htj0eApu
 mAtaaK9Vv7vTMujUpSkvkdv59rffw4S+b4wo7FklQ4IG/DkO+lejrQgJuaRUVn5yPkkf
 Ugo6AK2ksLHd7xu8urFifQ5nbrZf01NR6zdW3IrCwjZ2bEo68yYEKe+C3635MLiW5BSV
 Mmy+tihlpl7pk1aBdkegmzmwQtmMwLz+rebJoqtGTgAG8H+Fr6z5tMjoYOB8Diw+cuRa
 7z2JPsLcyQRrjG2k9P3H0xHTrBpndrxWp3GysVNseNU2L1WSHLLP7FLCS1SQXOXp1UY8
 EWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IfIxkLsRxova3XYkDm6i/K8H2HRLaB3EQ7huQjW3f6w=;
 b=X9W8TFG80TqZeFJ+Vrh7o0jo4dUICRPlMizZgWKQDdoc5LIz6rEe2HGJebVAVnJuF1
 VANigz6mNMORMzwPYQqdnnrhP7Y4S6/tmsNYKkk7Ehy2ltffoHOLUDYHIU4E1xjux+p4
 3HyJdA9cOv0TBD4XeVA+8q5ZnoYIqEBHfRPhHr0SUli0TMm4hQg4wgHuSMB2VDL0nmL1
 ghI4KB68ZW4YgKbi8nEWSrS7bLAz7E7VbrG0JP0abQZrTLRE45B4KcIc8Qm232tSSP2O
 5ma0x7djJmhlx+O2gR94L/OUhWW2sBh/1zoVqdV7DlGtj82dddShEYDc1E8ggV7G3f+o
 8nIw==
X-Gm-Message-State: AOAM533Raa6MuKSVCM3J1uMropVHGmzx4GIUkE2hxwXnnV/mAEZkNhLb
 mn4CfITH/i9afNhes2M0oIJgvlttc8Rx8go0+NWdlQ==
X-Google-Smtp-Source: ABdhPJx8/ShV3Gs8ffER3S7rZnw0ZFPWF5N02fGQqTCvCQFx6YSWKYgZLvFexBYVMpA5tpKhoxssOwaUlfs41PMlPVI=
X-Received: by 2002:a05:6830:1612:: with SMTP id
 g18mr3040756otr.251.1598269765865; 
 Mon, 24 Aug 2020 04:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200824081353.25148-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200824081353.25148-1-walter-zh.wu@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Mon, 24 Aug 2020 13:49:14 +0200
Message-ID: <CANpmjNNf5pr=0hKVo92M9fEnCy7sYbv==6Bv_sVSmn=rZi7JEA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] kasan: add tests for workqueue stack recording
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_074928_213399_8DF8150B 
X-CRM114-Status: GOOD (  14.30  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 Andrey Konovalov <andreyknvl@google.com>, linux-mediatek@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 at 10:14, Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> Adds a test to verify workqueue stack recording and print it in
> KASAN report.
>
> The KASAN report was as follows(cleaned up slightly):
>
>  BUG: KASAN: use-after-free in kasan_workqueue_uaf
>
>  Freed by task 54:
>   kasan_save_stack+0x24/0x50
>   kasan_set_track+0x24/0x38
>   kasan_set_free_info+0x20/0x40
>   __kasan_slab_free+0x10c/0x170
>   kasan_slab_free+0x10/0x18
>   kfree+0x98/0x270
>   kasan_workqueue_work+0xc/0x18
>
>  Last potentially related work creation:
>   kasan_save_stack+0x24/0x50
>   kasan_record_wq_stack+0xa8/0xb8
>   insert_work+0x48/0x288
>   __queue_work+0x3e8/0xc40
>   queue_work_on+0xf4/0x118
>   kasan_workqueue_uaf+0xfc/0x190
>
> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Andrey Konovalov <andreyknvl@google.com>
> ---
>  lib/test_kasan.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

These will majorly conflict with the KASAN-test KUnit rework, which I
don't know what the status is. AFAIK, these are not yet in -mm tree.

I think the KASAN-test KUnit rework has priority, as rebasing that
work on top of this patch is going to be difficult. So maybe these
test additions can be declared optional if there are conflicts coming,
and if that'll be the case you'll have to rebase and resend the test.

Thanks,
-- Marco

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
