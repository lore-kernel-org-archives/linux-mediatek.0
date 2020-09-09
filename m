Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3361DC433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 08:01:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D53F22087C
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 08:01:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ie/xjax3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1OebJGJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D53F22087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dKfb+4UXSjbwA6EdHpcxkU6C8eI1sJQBnbKK+vJTmKA=; b=Ie/xjax3aVmx3E6XZhdnKweSa
	7lb3y7owXIZ74rrAXP7IXP0ZYUSYdh2HxquHaaXwVHdVrq82ysujZ1t1ga6hPbzN1j0HbGTFeitQZ
	45vgVy6E3vKg3pA0Nz/v5oLFfEFI63Po9I3iXIIfbklw7inOR0MDUGCArjYj2LPCEbIncqHp54bcD
	wPCiQnrjLTfeixQZ7iIER44o2IxgUJsvFyQ8Y4uQ/ti+uj2LDDzsdKF/kG2SP7ZlEEOYv7Hie1CNA
	rTZ0lygEeZE8vUjIKuL3qpb4St/OR8FCXiNgZgA2fpX0RNuBjjUO5UVtF9lwh8KmPMUK+RUOZ5kIz
	SNs/HnCww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFv2X-0002Nk-V7; Wed, 09 Sep 2020 08:01:13 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFv2T-0002MV-V5; Wed, 09 Sep 2020 08:01:11 +0000
Received: by mail-io1-xd42.google.com with SMTP id m17so2225332ioo.1;
 Wed, 09 Sep 2020 01:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XofdRpK/NkNOwPn3C+UQHBTlj0f2ihnhjcjpsORpGg8=;
 b=V1OebJGJKe6lDiu9JKr0je3sMlGwKKkS2NX20512Txx+76F0SXyrUFjlo/MCwNuk4l
 HLEq/Sqccxqk7L1fGvD4mEI0I/C1c0xKHwR90buM84GYCOM116Fq8D21mwui91QUAowY
 bdT6ar1UTrgmQ2mgrtMPnbOnP/bYy/H0pf5WWlfYftDpqHR1nOw8v5Y8h9ko/OF3D9mu
 jrjzJwZKoPq+m+ntC0b922+fFAa8/axGvcZg55jMBfU/aMQC9bWEA+50knFEsBb6XdEc
 xqrRO8kzDSbPJ9FIqTUeu1bI83IT0D20NIZQHbZCw9/Dnxf2t7oGfQAyAmL1VIxE7RWB
 /PIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XofdRpK/NkNOwPn3C+UQHBTlj0f2ihnhjcjpsORpGg8=;
 b=pd95YcDN3ZrMhrUpxqNG0yDolCEV2dEMmBKdMG0se2GL4K+xiRzokQXF7CbREQ/9Z7
 D4/k5gtoIS4UEgQjC93LIrJynQ0N5GiTqUTLb08vWxz0FUMaD+y7SltBa708alrjokQ2
 4r8SZWeSK5acw9eF8EAupO9n7bWrTv3W67E+KD9PhkkQx8lbVuAgR2QUXO0PgRKngghi
 9DhDcrO4srH9J1eB/2MkqlhG4tWIYTPN+AJw4v08zW0O7aZm/z6pJ7X9VQPu78DZhm/k
 Ua1VqHo3AKgytUOu8Yi7OvglxREx1i8KjKxjcmhdfDig/VOJdG6FVPOZb8LxW9SCvhlT
 ONcw==
X-Gm-Message-State: AOAM532a4Q6K3r2kFfwXp9kGKZlvKArn+IA8T6KqVX6Tab3RiW5zkzkQ
 k1XJOSdvX3EaiYWuDK45Q/HkysEn7HB6I+//V/M=
X-Google-Smtp-Source: ABdhPJyRNbnMQgEd0sGWlFqNZ65UWqpRk1VGEzPh24kfY1R9J6cpzzZ12e/DQCuRJfoK+mZQiShNqFrRpmkm6YS5ito=
X-Received: by 2002:a05:6602:218f:: with SMTP id
 b15mr2335138iob.8.1599638468143; 
 Wed, 09 Sep 2020 01:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <b8d090b7-ef47-d434-1af1-2afbc2ad30ae@ti.com>
In-Reply-To: <b8d090b7-ef47-d434-1af1-2afbc2ad30ae@ti.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Wed, 9 Sep 2020 08:00:56 +0800
Message-ID: <CAE+NS36MgRHzHpUEadZxguBxmO5+b4qBKo4AY8kvoG9Nj2wpsw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] leds: mt6360: Add LED driver for MT6360
To: Dan Murphy <dmurphy@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_040110_029820_D5866C6A 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, linux-kernel@vger.kernel.org,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 linux-leds@vger.kernel.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RGFuIE11cnBoeSA8ZG11cnBoeUB0aS5jb20+IOaWvCAyMDIw5bm0OeaciDjml6Ug6YCx5LqMIOS4
i+WNiDEwOjE05a+r6YGT77yaCj4KPiBHZW5lCj4KPiBPbiA5LzcvMjAgNToyNyBBTSwgR2VuZSBD
aGVuIHdyb3RlOgo+ID4gSW4tUmVwbHktVG86Cj4gPgo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWRk
IE1UNjM2MCBMRUQgc3VwcG9ydCBjb250YWlucyBkcml2ZXIgYW5kIGJpbmRpbmcgZG9jdW1lbnQK
Pgo+IEkgY2Fubm90IGZpbmQgdGhlIHYyIHBhdGNoIHNlcmllcyBmb3IgdGhpcy4KPgo+IERhbgo+
CgpUaGVyZSBpcyBhIGxpdHRsZSBjb25mdXNlIG9mIHBhdGNoIHYyIHdoaWNoIHRpdGxlIGRpZG4n
dCBzaG93IHRoZSB2ZXJzaW9uLgpJIGxpc3QgdGhlIHBhdGNoIHNlcXVlbmNlIGFzIGJlbG93Cgpb
djFdIGxlZHM6IG10NjM2MDogQWRkIExFRCBkcml2ZXIgZm9yIE1UNjM2MApodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3BhdGNoLzExNTg2OTU5LwpbdjJdIFsxLzJdIGxlZHM6IG10NjM2MDog
QWRkIExFRCBkcml2ZXIgZm9yIE1UNjM2MApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Bh
dGNoLzExNzM3OTk1LwpbdjNdIFt2MywxLzJdIGxlZHM6IG10NjM2MDogQWRkIExFRCBkcml2ZXIg
Zm9yIE1UNjM2MApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNzYwNDkxLwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
