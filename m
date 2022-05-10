Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EF9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 09:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ahRzKdmOAOZcce3eNeNimWedHTK96a+qeE1zhkDbpzA=; b=AwGTz10G1ZXH1J
	TY1LcYd79icxCp05XVhZKSbk46ToFB+2lfly59TqZcgl98kg98GTe1eHxbsgfLyqsPNdFgpP3mIIq
	RAaQd8CwmMMloWWf/4mzrrAJaHaRYdSWmNJQ3GsGvgqyoDXXzgHvdO+n93tx4QdkK2K0MPMd7EIv7
	kj+5Fjq+0QKpfMsgSrrnuyn9kmgDMhuHqohk/EQZ+WAmT2N5u/LNocFCksiODsR+4G3sRP0yq0ocf
	IrF70IxHqpOCrto+Or3zmPYvVQFAWSjv6GZUrWjCyJW1kenH9KSYbUOgAsCqxfaZgoy90RIokpQo7
	ctiBGR3P42eTysTd0tgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noMAZ-000pH9-N8; Tue, 10 May 2022 09:28:39 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noMAN-000pCP-A6
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 09:28:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id q4so13351217plr.11
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 02:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=z3lYLkGJEXnAUi0c+xoObDyUdD6BSjxjjdIs4qDVH9c=;
 b=T4dSTnw/ZVibhtlFufil1OlNvDOmLFga7jJrDf6lwuWfmFfttDkMsEWCS8LI8fVRaa
 GAgX6IGokf40id9lHothsH+/GGYoXq89N4TtpWXrnG4ACpv5PBRVTkRIGhfrgFKDblC8
 h7C/F4qZJRc6MzQhU58jTZ8qI0Uszo080M+TczJngTfERbz9ss6xjD8/a4DqtIYwaUaA
 V1/VhNPvfzVLwMQ/5Gj1zwjN4ZIQ5dEEKUIiobc85rZMp8vRgvlEz+6hS8aJ4Qlhpo3X
 X/7q5e+fEFWUf5kX9bqrXwhWpCxbsc/aEIcBkwjnE30myDbjIE30cEa0jFFaPrkjJ3fi
 UJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=z3lYLkGJEXnAUi0c+xoObDyUdD6BSjxjjdIs4qDVH9c=;
 b=8B0/rQJ3YM+oXXU7zC/9brjtM/smjxwDv9CgelzBd4gVjMtga5z6bH5SWTSGEO0OSW
 rXxMFpMqLNhwQ3NWNDE9m1T+GmFKfuNS5l8DjEs5kUIi9QexI1TXXgeWlWzsnuSMgUN+
 /1/zu+1gQdQO07qZd1uPPydxTlFt2AuqWTNisAyBI+jVj5nBHMyuzaqnsKZ5Pnt3Rcbq
 R4FRfnzogWWGiApZcRkv2c/t9EBC+shvfOo/XcAGCFg2cYJ2wddtFezOKkQvEFByA0NA
 IQ+0lkbtTy0MUCYg1yYCL8YxciRBrsemZ62LAlKU9+GOTcMd7p9ynH++Iq6p1zItsx+W
 zHmg==
X-Gm-Message-State: AOAM531xGFKyRlrIWqtMFgE6XusPvfY0tt3OQTsU/hSxCDQkIruAVSbo
 nX02he+IenKwyvlZRi0yneapyw==
X-Google-Smtp-Source: ABdhPJyJh7XBDpHQBR733lWsZngmSm7+5DfzAPB2gKzKihOiyOd5b9+fjtXzaVEnT5anC0+3Z5v97A==
X-Received: by 2002:a17:902:cec4:b0:15e:cff6:676 with SMTP id
 d4-20020a170902cec400b0015ecff60676mr19946880plg.2.1652174905212; 
 Tue, 10 May 2022 02:28:25 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 2-20020a621702000000b0050dc76281f6sm10128012pfx.208.2022.05.10.02.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 02:28:24 -0700 (PDT)
Date: Tue, 10 May 2022 14:58:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jiabing Wan <wanjiabing@vivo.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] cpufreq: mediatek: Fix potential deadlock problem in
 mtk_cpufreq_set_target
Message-ID: <20220510092822.j3z6bydurg7x5bu4@vireshk-i7>
References: <20220510090531.12438-1-wanjiabing@vivo.com>
 <20220510091212.olrvvjlx4jtm7zw2@vireshk-i7>
 <49566544-e8f2-ef38-288e-fcd276d87d3b@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49566544-e8f2-ef38-288e-fcd276d87d3b@vivo.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_022827_469055_37222B29 
X-CRM114-Status: GOOD (  13.02  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10-05-22, 17:23, Jiabing Wan wrote:
> =

> =

> On 2022/5/10 17:12, Viresh Kumar wrote:
> > On 10-05-22, 17:05, Wan Jiabing wrote:
> > > Fix following coccichek error:
> > > ./drivers/cpufreq/mediatek-cpufreq.c:199:2-8: preceding lock on line
> > > ./drivers/cpufreq/mediatek-cpufreq.c:208:2-8: preceding lock on line
> > > =

> > > mutex_lock is acquired but not released before return.
> > > Use 'goto out' to help releasing the mutex_lock.
> > > =

> > > Fixes: c210063b40ac ("cpufreq: mediatek: Add opp notification support=
")
> > > Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> > You should have added the review tag you received.
> > =

> > Applied. Thanks.
> =

> Oh, yes.=A0 I would add the "Reviewed-by:" tag only if someone sends
> this tag to me.

Didn't you get this ?

https://lore.kernel.org/linux-mediatek/304e7eefbb57e9c938737b64fbb515201c79=
44b8.camel@mediatek.com/

Rex, are you subscribed to LKML ? You can't send an email there without
subscription. I don't see this email on LKML lore.

-- =

viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
