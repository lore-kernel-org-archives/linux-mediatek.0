Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A67C001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 02:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References
	:Message-Id:Date:Subject:Mime-Version:From:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLRUl5AEz4xfBRj0i8SQThC0f/OuUsY40TC9Xg4abaA=; b=BoR/49sIyhOo5c8ut7FQai9yYq
	6YoL5ONNING8jI3sqEYwTaJ9NrvAZXMpJQOA2ZfYnohP8kAfFIyGS0fbFC8hCP6G5iya7UlQYZ+Nr
	TdTU+CeDD9VIlJ9c3jylzyKnFDWe66pMIgTwmIa0bcl24zoO8W6CfvDa5HsHR3HUvu52S5yBGAj2x
	/9OF04d+b4ZdhjSScv23Pz5JFzf2NjtbiyKVQMn0QKIhPbjF4/gcZgDhAOhfVre50ycD2fDzBpYHY
	Vv2fyRHf6Bmx0IesniVEPeNqh5f7SXjH0j9yiZ6WTOgqjXIy4Gc91GMQZBTeeWf3FcWNNCvPdgd0E
	a84vGBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJlsy-001hY8-00;
	Thu, 13 Jul 2023 02:16:52 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJlsv-001hXK-0F
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 02:16:50 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-403c653d934so2046421cf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 19:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1689214607; x=1691806607;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iLRUl5AEz4xfBRj0i8SQThC0f/OuUsY40TC9Xg4abaA=;
        b=hkYYZxV/H6WPwxqD8d9vTMIlQVEbUwmHDwP456khtAclR9f++sJEJVcmMm6doJpAaQ
         ogqF5NtL1hNnF/kt+Sxly7CdccRu+h9u+yM79dJXBa0/Judo/EX7b42d6IVleLt5scnY
         FhIej7EBkK0LF8qZ58Pz9eSUj8zfP82glH7zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689214607; x=1691806607;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLRUl5AEz4xfBRj0i8SQThC0f/OuUsY40TC9Xg4abaA=;
        b=IQx8UyOuqgaSyXn2ZAW2ye6icy3XUflWsf8npuYdkaXrUezu7jtBDXshkADOCLMBnL
         CTPkwVAAd7wYS1gIRuaX1J5s1T1n8ek4Z7fV2EQ8qI3y++K5sG8ejR/jNEwLE+OHwMgl
         sevc+ej1zURMjoOltAxSIHqw7mZ29+fj7x7cbCaBOCXjLmmjrjPqa0WfBuXIYD2y/4Tb
         tpyAWPncdJh1vM5T2KC3vmEhb3v3OnPtWmmadZZBx1wQ551y+woxrpxGdBnfGy9T09dc
         qsy63dMNZGs2mu34dOJqZyzfBIXwCU0oJrmVAT3QKDpgYH5YxxNt8Hosw+uTrBxyGyLZ
         V22Q==
X-Gm-Message-State: ABy/qLYh5v9zgXfgxaNHaU2afCEyYRzktv14xbuWUD/Sx5KrqqqhE5BJ
	fYByERZjd3c8UxJASQTiE7bMAA==
X-Google-Smtp-Source: APBJJlEHYFXDl9ioZHBQvN/8vyjr4+5VOyHSJ2h1343YSyKCNTY2VRSulWSAIsk6+5Jj5IBsNS3DvA==
X-Received: by 2002:ac8:7d4c:0:b0:401:e1e7:a2a4 with SMTP id h12-20020ac87d4c000000b00401e1e7a2a4mr404180qtb.35.1689214607496;
        Wed, 12 Jul 2023 19:16:47 -0700 (PDT)
Received: from smtpclient.apple ([192.145.116.85])
        by smtp.gmail.com with ESMTPSA id t4-20020ac85304000000b00401f7f23ab6sm2713019qtn.85.2023.07.12.19.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 19:16:46 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Joel Fernandes <joel@joelfernandes.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v1] rcu: Fix and improve RCU read lock checks when !CONFIG_DEBUG_LOCK_ALLOC
Date: Wed, 12 Jul 2023 22:16:34 -0400
Message-Id: <5DA6D217-8847-4760-9C23-CB1B26B5CC2B@joelfernandes.org>
References: <161f1615-3d85-cf47-d2d5-695adf1ca7d4@linux.alibaba.com>
Cc: Sandeep Dhavale <dhavale@google.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-erofs@lists.ozlabs.org, xiang@kernel.org,
 Will Shiu <Will.Shiu@mediatek.com>, kernel-team@android.com,
 rcu@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <161f1615-3d85-cf47-d2d5-695adf1ca7d4@linux.alibaba.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
X-Mailer: iPhone Mail (20B101)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_191649_121505_8A3F0543 
X-CRM114-Status: GOOD (  20.78  )
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



> On Jul 12, 2023, at 10:02 PM, Gao Xiang <hsiangkao@linux.alibaba.com> wrot=
e:
>=20
> =EF=BB=BF
>=20
>> On 2023/7/13 08:32, Joel Fernandes wrote:
>> On Wed, Jul 12, 2023 at 02:20:56PM -0700, Sandeep Dhavale wrote:
>> [..]
>>>> As such this patch looks correct to me, one thing I noticed is that
>>>> you can check rcu_is_watching() like the lockdep-enabled code does.
>>>> That will tell you also if a reader-section is possible because in
>>>> extended-quiescent-states, RCU readers should be non-existent or
>>>> that's a bug.
>>>>=20
>>> Please correct me if I am wrong, reading from the comment in
>>> kernel/rcu/update.c rcu_read_lock_held_common()
>>> ..
>>>   * The reason for this is that RCU ignores CPUs that are
>>>  * in such a section, considering these as in extended quiescent state,
>>>  * so such a CPU is effectively never in an RCU read-side critical secti=
on
>>>  * regardless of what RCU primitives it invokes.
>>>=20
>>> It seems rcu will treat this as lock not held rather than a fact that
>>> lock is not held. Is my understanding correct?
>> If RCU treats it as a lock not held, that is a fact for RCU ;-). Maybe yo=
u
>> mean it is not a fact for erofs?
>=20
> I'm not sure if I get what you mean, EROFS doesn't take any RCU read lock

We are discussing the case 3 you mentioned below.

> here:
>=20
> z_erofs_decompressqueue_endio() is actually a "bio->bi_end_io", previously=

> which can be called under two scenarios:
>=20
> 1) under softirq context, which is actually part of device I/O compleltion=
;
>=20
> 2) under threaded context, like what dm-verity or likewise calls.
>=20
> But EROFS needs to decompress in a threaded context anyway, so we trigger
> a workqueue to resolve the case 1).
>=20
>=20
> Recently, someone reported there could be some case 3) [I think it was
> introduced recently but I have no time to dig into it]:
>=20
> case 3: under RCU read lock context, which is shown by this:
> https://lore.kernel.org/r/4a8254eb-ac39-1e19-3d82-417d3a7b9f94@linux.aliba=
ba.com/T/#u
>=20
> and such RCU read lock is taken in __blk_mq_run_dispatch_ops().
>=20
> But as the commit shown, we only need to trigger a workqueue for case 1)
> and 3) due to performance reasons.
>=20
> Hopefully I show it more clear.

Makes sense. Thanks,

 - Joel

>=20
> Thanks,
> Gao Xiang

