Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B75CA101C
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Sep 2025 06:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IglsR+oUgnc5OGxBKrJvs30oGCTNsAedJE467XKBqjg=; b=dT/ZUlcC35LS9P
	wP44sjZXbclNEAmn+KIx+9aoqu6fBhrfrLtDpiaOaHyYzt6GfDcsssQUYRqZ7ZbF0I4evXB7ollY9
	1qj3btQPD0pCaXGlpAdI9dNXqKf0Ezw4pg97nL3v7/xWjLTOG9PaYShEH10FJjwq7Z9dUj/PZQvtp
	WhQhMhPBVYsYbaVv7qLlLsgyB1DWIAt09WMT9doDNL0ZpYMWGa5hf6MMHis1kn9m295pRAgBHX+W+
	D7a51SGW4lByJveBN8ypA7wonld4sWaVK08Ozsn7G6zAZs6YTq1/Gq9sVPKwdzXK3kNl/dy90tEPr
	wgUO2ubzxX6x2fTnbxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3hc-00000009cPU-1TXc;
	Thu, 04 Sep 2025 06:44:12 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3dh-00000009atZ-1JWK
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Sep 2025 06:40:10 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-80e2c527010so31053385a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Sep 2025 23:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756968008; x=1757572808; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IglsR+oUgnc5OGxBKrJvs30oGCTNsAedJE467XKBqjg=;
        b=IG+tKjgqsoAG9wm3TeH+i9amRoXMVVrmpe8gPCBBwui725V4yeP9Nl/ZIJ6bTVgYtL
         FGqdb0WBoJKTtlm0feRrPKZka4mBGxtvxTQPVQCh0kzsE5/5yBFuLvIQdqEn13tMfgK8
         lgcjh4fJ3ZxWdSnChpuq6FIwHGliD2FTJIbbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756968008; x=1757572808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IglsR+oUgnc5OGxBKrJvs30oGCTNsAedJE467XKBqjg=;
        b=LpNv8iLNCxo73MdJvOPpyUC13o6be4+T0zlk27IbWsFrl7BCZXWADU9VbL9E6d4e4a
         7l/dgCbEVo0cQFwKw15p5Ezh/VxmHs2zDYMdhi4WnNZd8fsZ/mDtbFdixINTvJ9ZJAse
         4dhxwG6IaU9E92DYdSL/cCPPz/zoqPu8VJVFoxbJCL68WVzFX0cQgMVplt+2/Md4WxkC
         kAz9ia3QZcrrC6O93gCcjQE6Jhh3LaMvz0ui9+/PYrMcAICsy+rASznnuRwspIK0Btd2
         CUstNjXE4aFlBdCBlxuhh1a3YDpSIVlgsa+x7BT8FoAR7RW7CR9ZhlF3CNe3sccxvJ2X
         Getw==
X-Forwarded-Encrypted: i=1; AJvYcCWS84ocpiB30GYWPuiNK8nJIbb/omywCUX0mgCbwFWfdjjLYialGAGUmJ3NZ6la1ooLigsbLmyV5wPbfWq/GQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwM8M6ueq+RWKVfy1cOAPEshRD2ywUOZR8F2D7VS4/ec5P64rtE
	5AH4PiTTsPnsi6UatbhcXBT8WGU4XyqQtHXZzbU/caV9UcpsvJGESpVj7yK5vuxm+yJGegYaMkp
	DmE6HMA==
X-Gm-Gg: ASbGncuSro966+8LazT5fQm1r8C021PtQvGVL22F0Tmeh9SNRVG0/XlXmKDrCtijo/j
	03GOIINpRKJBU7NBWWLtneCqOu5S+JXshiD+XmdtoJamyeddRmsa3iANm02nYodurjMkLv3JB2D
	4bybcuVAzWrnrWr4nga88NnCsBdDWdlITPEqLfYiLk4/c5BIOH3ZYxBoaB1nHe1eCrho1Ep9ko/
	xdFBmJRZRY3kh7dTDLe1LmLMHtEMkVcaHCHqgkGYXNIMuy9E4Ntf/AVEjZp15bb3/+x99xEfuWH
	ob/CURPqLJo+Ey4/+QdWssQDH6LyMszxFB1GDQifPS37fnWLMmnJOZSper/CNWiGKzc0Ff/dubm
	CnYDfrbdcRwpykftpKG3uukgVhlwktjJHXiCpV+yPKet/LPXY+cvTzAjbSlXs6Q==
X-Google-Smtp-Source: AGHT+IH2AEv3YqIS7+AUsbGnGATuXNfrKVe3KGkjRwsmj+IoTIyFDE9v1mILYbqLDLnMW+ff1xWYNw==
X-Received: by 2002:a05:620a:1790:b0:80d:88b8:e670 with SMTP id af79cd13be357-80d88b8e6a4mr335180185a.34.1756968007578;
        Wed, 03 Sep 2025 23:40:07 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f7a37c6sm24475671cf.47.2025.09.03.23.40.06
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 23:40:06 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b48fc1d998so150891cf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Sep 2025 23:40:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWX1rpsbc0XSmqUkpHpTIzxcaccCHv8dAFbhkzBac+LmC7jiJJK0h8j47U60Rlhch1TGPUYAe0LjhEXqReppQ==@lists.infradead.org
X-Received: by 2002:ac8:7c56:0:b0:4b4:9863:5d76 with SMTP id
 d75a77b69052e-4b5d909e59dmr2246271cf.8.1756968006022; Wed, 03 Sep 2025
 23:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250820075405.1041838-1-wenst@chromium.org> <CAC=S1njQ5z2Ezz2OXDJ6Pk_9EEPgG3gu=Os7uFv6Lmdq0X77og@mail.gmail.com>
 <CAGXv+5GgGs5LEGJV4fpUpxOXC=_Fvo3CA4S10zZGxes9C2HrEQ@mail.gmail.com>
In-Reply-To: <CAGXv+5GgGs5LEGJV4fpUpxOXC=_Fvo3CA4S10zZGxes9C2HrEQ@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 4 Sep 2025 15:39:48 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B=0Zyyi2yJ5xD41LDBVYvAWoLu-oM_2XQORWgTDWo3uA@mail.gmail.com>
X-Gm-Features: Ac12FXywePb9g-RtWrinDg2p3M3RDgvhb_q591PKRsUpniRhwiiIjF_U8raEZa4
Message-ID: <CAAFQd5B=0Zyyi2yJ5xD41LDBVYvAWoLu-oM_2XQORWgTDWo3uA@mail.gmail.com>
Subject: Re: [PATCH v2] media: mediatek: vcodec: Use spinlock for context list
 protection lock
To: Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_234009_375409_684E08C9 
X-CRM114-Status: GOOD (  16.94  )
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 4, 2025 at 3:18=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> Ping?
>
> On Wed, Aug 20, 2025 at 6:37=E2=80=AFPM Fei Shao <fshao@chromium.org> wro=
te:
> >
> > On Wed, Aug 20, 2025 at 3:54=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> > >
> > > Previously a mutex was added to protect the encoder and decoder conte=
xt
> > > lists from unexpected changes originating from the SCP IP block, caus=
ing
> > > the context pointer to go invalid, resulting in a NULL pointer
> > > dereference in the IPI handler.
> > >
> > > Turns out on the MT8173, the VPU IPI handler is called from hard IRQ
> > > context. This causes a big warning from the scheduler. This was first
> > > reported downstream on the ChromeOS kernels, but is also reproducible
> > > on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even thou=
gh
> > > the actual capture format is not supported, the affected code paths
> > > are triggered.
> > >
>
> We really should get this in as this triggers a very large and scary
> warning every time the encoder or decoder is used.

Just to clarify, it does actually cause BUG_ON() panics, so if the
original change is already present in a stable kernel, this fix should
be merged to stable as well.

Best,
Tomasz

