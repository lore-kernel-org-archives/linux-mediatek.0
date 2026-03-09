Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F8CF41810
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2026 16:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8JlkWtJXJilTweLrLD4+Wo/zd+tXSF3dlwLCx57kQ4=; b=rXCYC1/Wc/Fo1sk/6nmGur6R25
	d4gpReOIUoj296ioiTbcPiayzHM5VnBfgMyzJFpTVnueUMAXb0BsBIsyTfCSrE8KODR8WoVsBWxtr
	A7NG3FktjVx1+BHw2VOzJ+o2mRP2VgdswyXvWXjChr1KMz2xoFr1m5YpOlCGvygJp5YM334vhedCS
	bh6pEHUexMJcsbg8BtKRgc8spbYfZPkAuVdjYpBwyh8zNLfHFI930QDot4dN2+fXtAK6EMEflvKIt
	yzlfXKvsQiEGG+EaWVkQlqNkjPELC0MqEYB3BBfFB1JMbIxba+flM9aR5dtocBGme4hknvumHq/o6
	CZRke0aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdao-00000007kBh-3LB5;
	Mon, 09 Mar 2026 16:36:30 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdaj-00000007kAG-3Al8
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Mar 2026 16:36:29 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-660bdba9390so9682785a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 09:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773074182; cv=none;
        d=google.com; s=arc-20240605;
        b=FKd/BiyNUtfvdxCFt7PkMoA8wznSohzl9EeQ1+5pryNUcRwCUXReER8YZjgDV/dkRg
         puRD8R+B/N9Rj3mg150bVkrxVis2eNIKi2u5ml0eBaDuxQwRPfZW9LZGuEbcEqtVs4Zx
         oGtt8I3zmJvfXnXBGufx3Todb/vmaNikjevhFKwV2yptYB6n2zbhlaK5jpS3i7DSHXlY
         G7vTktROGWAEH5DVAedXvtW23BDTjPQGWlZCp4bk1YdMlcEktoJPyFUHzuYvA8RujYYN
         WmGCBpiM21mNquN1qy3ceNOV8o209bK51eif4TOcvYmiLSIpnquujgojvZ8I2lH5smEF
         iWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/8JlkWtJXJilTweLrLD4+Wo/zd+tXSF3dlwLCx57kQ4=;
        fh=jwMivt/nNPw3O5h3IqPklahPjyvs71XAoafNLHJs+Rs=;
        b=Wd02uWreqB2ZnB8AqLqMPLnrG+EDEPi4vtEOBjGPeMSCVv87QHYdLUsf7hZ1h8ph0G
         cNAjwEpVbf6DR0ug842O014u68q48o/tGccLIlgXuAzVIC+hFvHAPD0vyN7bqpz3e45Y
         lpcjid3n0Lo8dXqCf+Wtms2Upo4GPv8vEGDxDSF/I2x1GITgFb4G36U6da3TW/xx8iLs
         A5jtXh6PjcErecbIeSCDFrvnU8wIOcfkMM1Uy80NN2ibEHp+iDuFkPzyFXk6b6zkoMbh
         O50NhUgeRuNzswiNVT7F4RD97nDhsnHBf/6M/D/jtVmObt/pCG8tfoRvO4QwmYfnzgwV
         Sd3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773074182; x=1773678982; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8JlkWtJXJilTweLrLD4+Wo/zd+tXSF3dlwLCx57kQ4=;
        b=i/eWuU2KILekiNODYpDK0Woqk5peLoFhcLRfoiWtArECTLYr4d2h3nN64Tz/WwfoA6
         WXATXHhZnoayG5FKjDo1NpSWRsN9VCjQuhcb66LJZODs6gOvRI/skU1RRLv6+qdHUWKf
         hSqyNWMKM3IeBUmJ4OZCQlLGss2ojV06ER9yZm2yyot9DwbbEOp0TL74RAaYWVYsozXD
         V76ed7UqKX5fBHNHsizrsDPBypy1Ub9rFiSF1HKFDKPqk2bQx8mrv65tIesywc/2Aixs
         77PqUWql6LviEWO5e45ICeH06/C2a/QxW+8GF5VzgQ5D4oXR/v//tghMUiQnjmhpURTE
         3m3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773074182; x=1773678982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/8JlkWtJXJilTweLrLD4+Wo/zd+tXSF3dlwLCx57kQ4=;
        b=AfQC1OrGFE4zNRaQUxIQukK66lpzbTxxaETINzjSnEj6poReHK6XQz7zPGeFd0iP1D
         nu0RBcoIeAG8ISQ7gOvdccX0VUydFTdKIwltr8EIUm2z5Wy4MBtIuCyOWYFnuT5hzYK/
         TC1AgY6sUGGhYKZZIqOuLavciCnEvddI2+XBOSOqDxqSWAbUInE+nWxgRV+TQAv4Q1P+
         GQ0QXmIZCNYGN1PCeCO7Tas3sYxfVFy11yG37JcfxeJu8sTPAeJemn7oaSV0uTw7bP9a
         NmBOOWtvQke4U5dg9UJ/7PWskGmFBYtDWAxbmg9S8QOYNOQ7A0PwdhCy9xkpzNeSq1IA
         7mJw==
X-Forwarded-Encrypted: i=1; AJvYcCVK3Hi1foCw3Dq3yUd/v5HbchPvsZzi2H1gyZCGSfPEOd7UDxwWszLWQV8HNGx1me9haFltPiu8mnYn5A3tZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9kmfMtjoTxQDxd/f1A88RH4edcNO9qL8fP9pUDCrpXUvpUsC7
	B2MGMFZm319P6Jm8Wwi2GJLWntpLOB92C+XLWlJFbnUT4bPIYvsi1mEIAmgRfqLaOzCJCFwmIFm
	oIgWCUYCuRXTPLXpCS3oGEK49mPIUpi0ktnog
X-Gm-Gg: ATEYQzzW0Hf55W1oN+MlAZC19urMle74nag18hqTEezEU2Cl5zp20ImBQPh1w+Z59U1
	PS2T/kciZMP5Pxp1ahk3JqZyQmh59QZaaxfeOTMBkvS0WziPz9YNRkjauvFKvnTptEYa+W76ge1
	MpTg/YZgcBpErnGSSisHpIMAnHE4h33BfomzNfsS26ZWb52L2YmPPMy+pgV2bpTCblCjuWa6f1y
	d548c8nA65DeBM8+1yGnC2VIHB2x/MEN9LLYoenMTqOthvCMel92GxZiLDi1jAnrMMMewg+ETBY
	J3tqcQ==
X-Received: by 2002:a17:907:980d:b0:b7f:f862:df26 with SMTP id
 a640c23a62f3a-b942dcec505mr647443366b.14.1773074181199; Mon, 09 Mar 2026
 09:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <CANAPQzi3BkfnRS4CEXAA560O5cO8e6MEYxeVVx1u+xUeXS-gmA@mail.gmail.com>
 <CAGp9LzoidBL1iYYC371+Fw+drbArLRTneJKxCoFiitx=dweKCg@mail.gmail.com>
In-Reply-To: <CAGp9LzoidBL1iYYC371+Fw+drbArLRTneJKxCoFiitx=dweKCg@mail.gmail.com>
From: bryam vargas <bryamestebanvargas@gmail.com>
Date: Mon, 9 Mar 2026 11:36:10 -0500
X-Gm-Features: AaiRm53VWl3-9agawQkBx36EPIJKLrChGbKxKcgkpyuLm8tQnnRcvQuJKHepZ7s
Message-ID: <CANAPQzjiBf8Rqphn2SypYN2O6bddj6vB=63Mp=T5YVEt2oGvyw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mt76: connac: fix txpower_cur not updated in mt76_connac_mcu_set_rate_txpower()
To: Sean Wang <sean.wang@kernel.org>
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_093625_811972_72C16B86 
X-CRM114-Status: UNSURE (   7.13  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sean,

Thank you for the thorough review.

For patch 1, I agree that updating txpower_cur in the write path mixes
concerns. I'll implement a mt7921-specific .get_txpower callback that
derives the reported TX power directly from the SKU limits instead.

For patch 2, you're right about the race condition =E2=80=94 scheduling an
async USB reset while the driver continues the normal reset flow is
problematic. I'll rework this to trigger the USB reset only after
detecting USB transaction errors or repeated mt792xu_init_reset()
failures, as you suggested.

I'll send a v2 series addressing both points.

Best regards,
Bryam Vargas

