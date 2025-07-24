Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC85C83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inucMIKhxEvXP9jZT/ROlUmFAW5Fk+3g/o1C1Us0aGM=; b=jKlW3Tul0W+fCiTrc1Vm6dzztf
	PCj634+XqOEt+GgqH9+TQctwQ5QiAZ6SWAg929UPbXa3B0TnWGxEXU7jY3dQG7tBg9XoY2cVoKGd6
	FvbPq3Hfcu85oWGmQicRqydZK8EZOEmv0bNFsB3bHZygFWzp9HGnhxtRENxLVx4T0VlTxFSKXit2g
	D/w4YmRZAMCbxujq98OIST+b5+9ML3M4gY+BHE8SNJNyE1u+nQDcqkWe9qhh85HLg5m34BRl4Bm85
	Ng4jyTCoE0V8TeaZklFqs87zP/P6KiZKzsjuZh2P2TpZa9bsTlZwv4aOEsSbizPH2YSX0ebBSW2Q0
	GA5mWtIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesHf-000000072yb-0mYl;
	Thu, 24 Jul 2025 09:30:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerEj-00000006qj0-1oiV
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Jul 2025 08:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753345412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=inucMIKhxEvXP9jZT/ROlUmFAW5Fk+3g/o1C1Us0aGM=;
	b=YtSsf0rELQQXdyXLLLp92rLiLKd4D1b/dTJ9+yHfshldG1qOs/XYa5lKIC5PfcGqmAQ1Tv
	tUVUeWVXwnDaRg98d9C5UT4g2/xocKv0F9iwHuLixNEMCJyOMDAulOojDtWMxbTe+UmQ/f
	uGF4yqvdTEy5cb51yYVPPm12E3jyldc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-d73jv-sqNJSl3ufwRfq5DQ-1; Thu, 24 Jul 2025 04:23:30 -0400
X-MC-Unique: d73jv-sqNJSl3ufwRfq5DQ-1
X-Mimecast-MFC-AGG-ID: d73jv-sqNJSl3ufwRfq5DQ_1753345409
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45867ac308dso3719375e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Jul 2025 01:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753345409; x=1753950209;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inucMIKhxEvXP9jZT/ROlUmFAW5Fk+3g/o1C1Us0aGM=;
        b=Dl/3fvObjcHYUeGJ5aCX44kVfL7eEObXGcseNL8JTw2sZoSfX0chxgkdHj3BWnoroe
         NpI4xC78Drc6EXmeJihVytcOxO5CmdworlpnwqyluMncy+uhpWJ85+nRH4VqhFUsL64Q
         Pf6s0vjGQtu2T9IbLTKZHx5tQf1VT6G21YSc1nzQJO/cwrd28bufZxUiqjqc6NqAYtqs
         CfnlZpbgF1eb/pFRe8/PVdqI13dGIpVWGn8o1huZ/RB7Q7HwB1CNeUMduspI7YUe8dbM
         n3ilnKHA1di6H4ouqHGOyLrcU6V1Xib2Gtt0IMsThuvR143IeZyyjiQwgumnjZXT/YME
         LNzg==
X-Forwarded-Encrypted: i=1; AJvYcCUAmjAYAq9QwfoFBOrM/7Yld8gZXBpbBmuFHC4HllOq/nWH8AZCwqoQEC5wzlx5ky5tDD7/cvpz5XBdgIlE3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqRz1fgiTFt6kCe1i/B4gOu3tZMR6sQIOznFKqQTO1m2m010CG
	4HwdKHTgRNv8epDja4lRDhhwLM2uNEtqISmI6B89zFAhhWb1tUgika1sBCp6+w7f0Z0x+G2+mTa
	0yORYSav2wYk1yFOD/jj6U7LC/uSYKBySbNPQSVAfgojnIrXonXTJEHYhYmVn+Gw7SgqAytlQ/g
	==
X-Gm-Gg: ASbGncv67hiBGdPWfNqHePrIlu0vXMLiRR/ravwTbjgIuOSvoqnzRnFw9g97lu58ErS
	lttRiY28Amg5gVZE1It5n7tNbPBAxIsb64/ll/L5MRyX4MW/6MzCtgxaeuPy7q/eyfo3C/wa5UZ
	+LNRcEYE0zoN8Ls+uv9LqfDrXXkhmD34wE4WzwgFuAXvLuwhefTCzV3LgcpxuHPeOWU+kgOU4MZ
	ZlYAyN6k7MGMMwnE0OIn/5LUM0O1QDVOHgOKnp4XVC+aY76fhEj1vjK7+RSR93cbocvOCtsmF5w
	hxzSzcbx+EeEozbTAPsTwmBwZNCuJDJOrfSoUa5rkJs7IoPylkkejABy/dUWrwHsnLXwkg==
X-Received: by 2002:a05:600c:8b08:b0:456:1b93:76b with SMTP id 5b1f17b1804b1-45868c79052mr53695525e9.4.1753345408889;
        Thu, 24 Jul 2025 01:23:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdtLcyEdZUOsZv2sq0CbPs5hZqiaOagRDT3jXPlexGgIDzMlul8E40cqYAQwrjLryESM9Uzw==
X-Received: by 2002:a05:600c:8b08:b0:456:1b93:76b with SMTP id 5b1f17b1804b1-45868c79052mr53695235e9.4.1753345408515;
        Thu, 24 Jul 2025 01:23:28 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.46.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm10581635e9.14.2025.07.24.01.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 01:23:27 -0700 (PDT)
Date: Thu, 24 Jul 2025 10:23:25 +0200
From: "juri.lelli@redhat.com" <juri.lelli@redhat.com>
To: Pierce Wen =?utf-8?B?KOa6q+W9pee/lCk=?= <Pierce.Wen@mediatek.com>
Cc: Kuyo Chang =?utf-8?B?KOW8teW7uuaWhyk=?= <Kuyo.Chang@mediatek.com>,
	"bsegall@google.com" <bsegall@google.com>,
	"vschneid@redhat.com" <vschneid@redhat.com>,
	"dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
	"mgorman@suse.de" <mgorman@suse.de>,
	"jstultz@google.com" <jstultz@google.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [RFC PATCH 1/1] sched/deadline: Fix RT task potential starvation
 when expiry time passed
Message-ID: <aIHtfRB6UuVVbp2z@jlelli-thinkpadt14gen4.remote.csb>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
 <aFAyN4rfssKmbUE5@jlelli-thinkpadt14gen4.remote.csb>
 <089882f95b1b910f7feecddd0ad9b17f38394c64.camel@mediatek.com>
 <aFQM8TdZIIvvGv8T@jlelli-thinkpadt14gen4.remote.csb>
 <6ec534be0618de3e2b4d81555e5f24155326c0b9.camel@mediatek.com>
 <aFV8qeH__bw0chWM@jlelli-thinkpadt14gen4.remote.csb>
 <a1103727ffaaf5f4d1b077bc09a3cc5168c5708d.camel@mediatek.com>
 <cd10d32b514d2792659fe03ad1235771982a6e2f.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <cd10d32b514d2792659fe03ad1235771982a6e2f.camel@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IoOs40gO_fHRvbwKpWcmZHWgl3VoYu9EigYZ4MI64iE_1753345409
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_012333_537543_039EBF14 
X-CRM114-Status: GOOD (  17.05  )
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

On 23/07/25 22:22, Pierce Wen (溫彥翔) wrote:

...

> Hi all,

Hello!

> I wanted to follow up on the discussion regarding the potential RT task
> starvation issue and check if there have been any further updates or
> feedback.
> 
> To recap and provide some additional context:
> 
> 1. As discussed in the thread (see
> https://lore.kernel.org/all/CANDhNCqYCpdhYS9afdKeY34Bmw8MXyqKWCSTxOZNLTjYrUaVXg@mail.gmail.com/
> ), it has been demonstrated that the use of a scaled timer can indeed
> induce RT starvation under certain conditions.

This first case has been handled by fc975cfb36393 ("sched/deadline: Fix
dl_server runtime calculation formula") on tip/master.

> 2. Furthermore, since the delta_exec time calculation relies on the
> clock_task member of struct rq, which is affected by IRQ time on the
> runqueue, there is a risk that if IRQ time becomes excessively long in
> some corner cases, it could also lead to RT starvation.
> 
> 3. Based on these observations, we strongly recommend adopting a
> recovery patch to address these critical scenarios and prevent RT task
> starvation, especially in cases where the current logic may not be
> sufficient.

As I was saying, I am not against the patch proposed to address the
starvation issue discussed in this thread. Maybe the patch can be
reposted with the addition of a comment on the code path related to
dl-server explaining why the special case is needed?

Thanks,
Juri


