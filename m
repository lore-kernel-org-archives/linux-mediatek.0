From: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH 2/2] kasan: add test for invalid size in memmove
Date: Mon, 14 Oct 2019 23:57:11 +0800
Message-ID: <1571068631.8898.8.camel@mtksdccf07>
References: <20191014103654.17982-1-walter-zh.wu@mediatek.com>
 <20191014150710.GY32665@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191014150710.GY32665@bombadil.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthew Wilcox <willy@infradead.org>
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Dmitry Vyukov <dvyukov@google.com>
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-10-14 at 08:07 -0700, Matthew Wilcox wrote:
> On Mon, Oct 14, 2019 at 06:36:54PM +0800, Walter Wu wrote:
> > Test size is negative numbers in memmove in order to verify
> > whether it correctly get KASAN report.
> 
> You're not testing negative numbers, though.  memmove() takes an unsigned
> type, so you're testing a very large number.
> 
Casting negative numbers to size_t would indeed turn up as a "large"
size_t and its value will be larger than ULONG_MAX/2. We mainly want to
express this case. Maybe we can add some descriptions. Thanks for your
reminder.
