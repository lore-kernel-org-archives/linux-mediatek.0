From: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH] kasan: fix the missing underflow in memmove and memcpy with CONFIG_KASAN_GENERIC=y
Date: Tue, 8 Oct 2019 07:42:47 -0400
Message-ID: <D2B6D82F-AE5F-4A45-AC0C-BE5DA601FDC3@lca.pw>
References: <1570532528.4686.102.camel@mtksdccf07>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570532528.4686.102.camel@mtksdccf07>
Sender: linux-kernel-owner@vger.kernel.org
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, wsd_upstream <wsd_upstream@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org



> On Oct 8, 2019, at 7:02 AM, Walter Wu <walter-zh.wu@mediatek.com> wrote:
>=20
> I don't know very well in UBSAN, but I try to build ubsan kernel and
> test a negative number in memset and kmalloc_memmove_invalid_size(), it
> look like no check.

It sounds like more important to figure out why the UBSAN is not working in t=
his case rather than duplicating functionality elsewhere.=
