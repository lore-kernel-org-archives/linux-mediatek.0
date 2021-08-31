Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA6BC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 09:01:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A26660187
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 09:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A26660187
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject
	:MIME-Version:References:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFwt8nRLgwlxCA1z5B/v+iZwDhawu3zBjYmFZ+gbH/Y=; b=W01IPREoIbOOxU
	cn6NIg8zbjYlf8IrkD60kp8zf5xz3oG1t3VWEtWrlWjM/FCaB6nq5Y917a6uy2tfT3PQZhcAUrgSv
	HhNX4OVSrIJqwitcBWua/VbaPqxdCWoPIiYDa8myB+V9GHmg/Au247ZgcPvOTfTM8IfQkO5dV/DnH
	0EKfyWOV+YJWyDXYa56T7hI/QJu4Jjfe/RQS2pM0BuG1MIXS0zLglKJ8yQp8IxAFabdat1TL7dWNI
	pHzVuo7rt9cUfYhJQ1GgdMAJj053h6vwHpvj5A3yUYfPmxF/jldqElqgndzIcDSWFBJk3pr1f9IZC
	3a1Sy70SUWtRFPZHHjkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKzdR-001rqY-69; Tue, 31 Aug 2021 09:00:49 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKzcx-001riC-48; Tue, 31 Aug 2021 09:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1630400404;
 bh=geC6jummpH913xck4Kqq+pCIvyvdgzsG+yQCENcEc+s=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=Xsy/hFufawuOyGmFd7sn0YqHyxwGH4xVnvk3ZGxPY+YJu/+kel2khtWFfKEqUsU8n
 F45N3CUY2pTtTWA7Jd98NvwRZKiVEJjZXQklRqLLQ6dZRP6tid5ZMwxUP9fvm3PHmW
 ObTr6DRjaX7DHxZLGYvQX/fj5VREzvkVHeEjeeRQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([80.245.77.109]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqb1W-1mpdTv3F6O-00mYGr; Tue, 31
 Aug 2021 11:00:04 +0200
Date: Tue, 31 Aug 2021 10:59:56 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <16f980b95e1f32bb8eb32448f1615bafdc51b792.camel@mediatek.com>
References: <20210822041333.5264-1-mans0n@gorani.run>
 <20210830155903.13907-1-mans0n@gorani.run>
 <20210830155903.13907-2-mans0n@gorani.run>
 <16f980b95e1f32bb8eb32448f1615bafdc51b792.camel@mediatek.com>
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/2] arm: dts: mt7623: add musb device nodes
To: linux-mediatek@lists.infradead.org,
 =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "mans0n@gorani.run" <mans0n@gorani.run>
CC: "b-liu@ti.com" <b-liu@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <14C40B35-3607-49C6-970B-441F9093125A@public-files.de>
X-Provags-ID: V03:K1:BwjuzFFpOwqolvGter7ofmISuM0KzZzqIugWamQrsY4X2p7n8CT
 RxQJjEoq7gUemkMcDiTQdFGTh7hpvJ9aQks+j19YeRfHjoLxuR3b6XQ/31He+ZeVjTU7mRl
 3MWVjzmO2fOo7Rw0gIQEuLxRAh6fuN9jdzfIujJLjqRAC5WPkDopaGLao0YQCZgh8Zj3Wg7
 Rqio26/e4xvFl3yk5BqmQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ztp2H4ZVSy8=:z0bvrzrU2U8eBz8ElEB1NC
 EJqvvijFZl0MEaOGXjlQhIt8taxLXDaxxGFqBMEjHpe9/hR4acAbuvLAq2L78kZbKBHFxKsGj
 dE77eCzSuX2EpBGpmFJVVSpZXQTQuO0izMRIiD/NuEpHezU3XLwODph8B6JQ1UCB3iUtnvGtD
 JUBMAllF7kJkkWoDeweeLYfS8oEOE5blvAOK0oitvSWvWpn/VdHWsSGXP1P199nAJOwwXjtbh
 /LyYH9Ki+CNrwAeadYqjhfp0bJmpAUKMYtZ9A4g5FodVc2Lt4vF2yIo/UWfsOh/t/2u9Exl7j
 HN8unWP432SqGjjTFgcbTrhWEyyBrvgE7ry61X3/5PPtRrtW20Mm1xm9uumd6pmDU7dpCCs8i
 c8rxNT+vaScfXijznBJU6I1+0TbxM86HRjtUJWjpCosdO5VH1LRL1XNiMhbVOXGfgW/jqpCrz
 2NoYbFV19IVaeG5weJlD7Q1J+ZRjryAaUj2uithLm/6nV0Ll7wL645ags20b5yvXaha99c/lE
 /Keh1oqfSQOq4zg3z0gQ0y4GEHHm5Ed7f/p3zI4jCOE5iXv+7jnbmAXF2JQ1MnUqc3tlhDJ5X
 ubjvIwThd8zT8hMMQgkZbaF25yyhvOYm62d0ZNCSo9kqkZWplpMl2OooWsMUljLoZ9eiEuxMd
 bTRL5pgfhxSsuac9bxy1D6sORV7nHto+S//P16U/qG27RiDvVk/zAoB/WfSDdTvg5FIn5DUBQ
 JbSPqnjRFzLPgY5fJOG8mMytYYTySzdOoKuA29GBkuF7DJZ/pDARVnjbEu2dPnkTZCg/9LGs0
 ogObwccsGfqw7a2t0T9MmClYixFtXXXnGjkmM2MfP3iRajcGvicNN2IS4ARWTdXvHWSr8jcjQ
 C88WHczCEInQyZgLItg1Re5kptMt4Vq0zqSTOKKI4ol/2f7rhYuK1/d0S+FQ7jZK3biVhUm51
 GHxi+8/EZC7yJ0CMJNU6Z7sAbG20OMbDln5nAL3MAPE94SQCW/mHD6UNqR1Fz0WPxFxzQzU7E
 auNvNSY0jO8c91S1Z6Df4u1/2Ty0yHOaSqwSj1L6Ohq/CGzYtc09fIEkLKFOvOe3SXg5+5AQI
 STrBcra9Z4eYKy3JUPwIX0nDIF1EjqJ3U5QQeoUuJ1l6qNiijqC/FOBqQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_020019_547005_48570740 
X-CRM114-Status: UNSURE (   8.06  )
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
Reply-To: frank-w@public-files.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

QW0gMzEuIEF1Z3VzdCAyMDIxIDA4OjI3OjE4IE1FU1ogc2NocmllYiAiQ2h1bmZlbmcgWXVuICjk
upHmmKXls7ApIiA8Q2h1bmZlbmcuWXVuQG1lZGlhdGVrLmNvbT46Cgo+SXMgdGhlIGR0LWJpbmRp
bmcgcGF0Y2ggYXBwbGllZD8gCj5JdCdzIGJldHRlciB0byBwdXQgaXQgaW50byB0aGlzIHNlcmll
cyBkdWUgdG8gdGhlIG5ldwo+Y29tcGF0aWJsZSAibWVkaWF0ZWssbXQ3NjIzLW11c2IiIGlzIHVz
ZWQgZm9yIHRoZSBmaXJzdCB0aW1lLgo+Cj5SZXZpZXdlZC1ieTogQ2h1bmZlbmcgWXVuIDxjaHVu
ZmVuZy55dW5AbWVkaWF0ZWsuY29tPgoKSGksCgpJIGRvbid0IHNlZSBbMV0gKGFjayBmcm9tIHJv
YikgaW4gWzJdL1szXQoKQHN1bmdibzogcGxlYXNlIGxlYXZlIGR0LWJpbmRpbmdzIHBhdGNoIGlu
IHNlcmllcy4KWW91IG5lZWQgbm8gbmV3IHZlcnNpb24gb25seSBmb3IgYWRkaW5nIHRhZ3MgKGFj
a2VkLHRlc3RlZCBvciByZXZpZXdlZCkuCk9ubHkgZm9yIGNvZGUtY2hhbmdlcyxidXQgdGhlbiBh
ZGQgdGFncyBmcm9tIHByZXZpb3VzIHZlcnNpb25zLgoKSW1obyBpdCBpcyBiZXR0ZXIgdG8gdGFr
ZSBteSBtdXNiIHBhdGNoIFs0XQppbnRvIHRoZSBzZXJpZXMgYXMgd2VsbCB0byBtYWtlIGRlcGVu
Y3kgY2xlYW5lcgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51
eC1tZWRpYXRlay9wYXRjaC8yMDIxMDgwODEyMzg0MC4xNzY3MzgtMi1tYW5zMG5AZ29yYW5pLnJ1
bi8KWzJdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Jv
YmgvbGludXguZ2l0L2xvZy8/aD1mb3ItbmV4dApbM10gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbWF0dGhpYXMuYmdnL2xpbnV4LmdpdC9sb2cvP2g9Zm9y
LW5leHQKWzRdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRp
YXRlay9wYXRjaC8yMDIxMDgzMDE0NTk1OC4xMDg2MDUtMS1saW51eEBmdy13ZWIuZGUvCnJlZ2Fy
ZHMgRnJhbmsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
