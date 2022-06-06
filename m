Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FD9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 10:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XY9q3t5A0KVawOSrNPX+KVyptfA0ZjrAhbOOnjvnyzU=; b=p7Oae3ZnG/xTSl
	V2Yh+LOVD6F7tUY4SbBV+2e7mWJUS6KmUb688AsGII4njcwiLJFfjorak31WdYR2uT2qTPLollubt
	L/PMAfmJ8Qmfen1pj/jE25UOStSjg2ZjEHt+zdW7sMSTrcHKTClsnosVvZoKOJRNpJwgW3j2Fs0+X
	8oU+MBPK1K6Q2g36ZCCjg3UiFI6nHsvZNYeLpTfLQogqC1dk/OZuGHMPE0JpzBGzS9kRFdTRkWq4Y
	BNYDg6pK42zLjYtLLaZ9mJ5/CyDuepC/IZlkl3tlp/DXh/fd62jjMAnu9wVgIO7Ou7+osuDBiTGcL
	Xttx7uaCsqZ3dqv57jlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny9mF-000gHJ-EE; Mon, 06 Jun 2022 10:16:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny9ff-000dKa-2Q
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 10:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654510152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WTpeojEBTrseUaMSVnCmShJgLb05X1O3wixL+XWUD1U=;
	b=essM2sqWy8dftnHZHG/8oTUmSs27/nf5xZkO1xevuIrNudDVtkacqC6DsJynEN9bCp+HRN
	+LGleoOhhLv69YSWlMWD1RrCyQVL7SaFl7hPE5n0lkyzy0tkNwlynhUTq1zDHq/Fj0zy40
	FQDW+8cTkBTAyk8jtxGkc4KWCFJ0x4g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-EWjwi7vQPv2tCdGeM18U9w-1; Mon, 06 Jun 2022 06:09:09 -0400
X-MC-Unique: EWjwi7vQPv2tCdGeM18U9w-1
Received: by mail-wr1-f70.google.com with SMTP id p10-20020adfaa0a000000b0020c4829af5fso2634974wrd.16
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 03:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WTpeojEBTrseUaMSVnCmShJgLb05X1O3wixL+XWUD1U=;
        b=nG26PTW8cEH65tgIInpbO1f5Byy4+5C/MArx+Pxaa1sElDdpVXDs3UikZ6VM4CEIlc
         kklAXQg4XXujYLwvG6GavSgBHxyVQgJnnG9O+oIn4u0BzM8LFuS6ezXQYWvWLvgje/kd
         V6/WwpseJuWTY+8isCR6owHUnZrGR5NE7Wxb5vi72NoUWqa7ckoh4DLvxI2h0iVOfc8r
         t27W6zNa+eLBqZxOx7IH4MEYZPvJXblnCKELVlMYWq1u4+sJVM2mqufyZ+UQQBB+JmtU
         pG727SLi2XQyyPwod/vH2o4qsa0SkKPscLg4OTA0Jd9xKVGkdi99qp6lWxc67DAG3GJj
         W7dw==
X-Gm-Message-State: AOAM533KtJunhZbROmBXvYDG3heiPTMwak7QMvsh5+gYP3pT2CV7slHZ
	a+a953yIXBYwWptAu0FaPR+A4U50Gi6i+1rY7lPDnGHwkxbtCppPCIjDyl2/O+MryhpW0Wg78xm
	RKsM4vO2WGmK9daib8fFecSTQBUb1BJBw
X-Received: by 2002:a5d:6651:0:b0:210:3e1c:1343 with SMTP id f17-20020a5d6651000000b002103e1c1343mr20795221wrw.137.1654510148490;
        Mon, 06 Jun 2022 03:09:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfuD0eMUP2v47G3d9f7pYllLF29ZboA6bfNKjPqw3VCslRaoPuPFtSStztMn0yQpS9t0z6uQ==
X-Received: by 2002:a5d:6651:0:b0:210:3e1c:1343 with SMTP id f17-20020a5d6651000000b002103e1c1343mr20795194wrw.137.1654510148287;
        Mon, 06 Jun 2022 03:09:08 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-112-184.dyn.eolo.it. [146.241.112.184])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c3b8500b0039c4e2ff7cfsm3344360wms.43.2022.06.06.03.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 03:09:07 -0700 (PDT)
Message-ID: <c8031ab902a2636d4badfe3fdff65930a1f2ac56.camel@redhat.com>
Subject: Re: [PATCH v3] selftests net: fix bpf build error
From: Paolo Abeni <pabeni@redhat.com>
To: Lina Wang <lina.wang@mediatek.com>, "David S . Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>,  Matthias Brugger <matthias.bgg@gmail.com>, Maciej
 enczykowski <maze@google.com>, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
Date: Mon, 06 Jun 2022 12:09:06 +0200
In-Reply-To: <20220606064517.8175-1-lina.wang@mediatek.com>
References: <20220606064517.8175-1-lina.wang@mediatek.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_030915_247325_63400E45 
X-CRM114-Status: UNSURE (   7.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2022-06-06 at 14:45 +0800, Lina Wang wrote:
> bpf_helpers.h has been moved to tools/lib/bpf since 5.10, so add more
> including path.
> 
> Fixes: edae34a3ed92 ("selftests net: add UDP GRO fraglist + bpf self-tests")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Signed-off-by: Lina Wang <lina.wang@mediatek.com>
> Acked-by: Song Liu <songliubraving@fb.com>

LGTM, thanks!

Acked-by: Paolo Abeni <pabeni@redhat.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
